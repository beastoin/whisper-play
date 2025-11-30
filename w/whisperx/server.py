#!/usr/bin/env python3
"""Minimal HTTP server for WhisperX performance testing."""

import argparse
import cgi
import json
import os
import tempfile
import time
from http.server import HTTPServer, BaseHTTPRequestHandler

import torch
import whisperx

model = None
device = "cpu"


class Handler(BaseHTTPRequestHandler):
    def log_message(self, format, *args):
        pass

    def do_GET(self):
        if self.path == '/health':
            self._json({'status': 'ok'})
        else:
            self._json({'error': 'Not found'}, 404)

    def do_POST(self):
        if self.path != '/inference':
            self._json({'error': 'Not found'}, 404)
            return

        content_type = self.headers.get('Content-Type', '')
        if 'multipart/form-data' not in content_type:
            self._json({'error': 'Need multipart/form-data'}, 400)
            return

        form = cgi.FieldStorage(
            fp=self.rfile, headers=self.headers,
            environ={'REQUEST_METHOD': 'POST', 'CONTENT_TYPE': content_type}
        )

        if 'file' not in form or not form['file'].file:
            self._json({'error': 'Missing file'}, 400)
            return

        file_item = form['file']
        suffix = os.path.splitext(file_item.filename or '.wav')[1]
        with tempfile.NamedTemporaryFile(delete=False, suffix=suffix) as tmp:
            tmp.write(file_item.file.read())
            tmp_path = tmp.name

        try:
            start = time.time()
            audio = whisperx.load_audio(tmp_path)
            result = model.transcribe(audio, batch_size=16)

            text_parts = []
            seg_list = []
            for seg in result.get('segments', []):
                text_parts.append(seg.get('text', ''))
                seg_list.append({'start': seg.get('start', 0), 'end': seg.get('end', 0), 'text': seg.get('text', '')})

            response_format = form.getvalue('response_format', 'json')
            if response_format == 'verbose_json':
                self._json({
                    'text': ''.join(text_parts),
                    'segments': seg_list,
                    'language': result.get('language', 'en'),
                    'processing_time': time.time() - start,
                })
            else:
                self._json({'text': ''.join(text_parts)})
        finally:
            os.unlink(tmp_path)

    def _json(self, data, status=200):
        self.send_response(status)
        self.send_header('Content-Type', 'application/json')
        self.end_headers()
        self.wfile.write(json.dumps(data).encode())


def main():
    global model, device
    p = argparse.ArgumentParser()
    p.add_argument('-m', '--model', default='base.en')
    p.add_argument('--host', default='0.0.0.0')
    p.add_argument('--port', type=int, default=8779)
    p.add_argument('--device', default='auto')
    p.add_argument('--compute-type', default='auto')
    p.add_argument('--no-vad', action='store_true')
    args = p.parse_args()

    device = args.device if args.device != 'auto' else ('cuda' if torch.cuda.is_available() else 'cpu')
    compute = args.compute_type if args.compute_type != 'auto' else ('float16' if device == 'cuda' else 'int8')

    print(f"Loading model: {args.model} (device={device}, compute={compute})")
    if args.no_vad:
        model = whisperx.load_model(args.model, device, compute_type=compute, vad_method="silero", vad_options={"threshold": 0.9999})
    else:
        model = whisperx.load_model(args.model, device, compute_type=compute, vad_method="silero")

    print(f"Server running on {args.host}:{args.port}")
    HTTPServer((args.host, args.port), Handler).serve_forever()


if __name__ == '__main__':
    main()
