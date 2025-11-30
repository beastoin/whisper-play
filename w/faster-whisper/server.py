#!/usr/bin/env python3
"""Minimal HTTP server for faster-whisper performance testing."""

import argparse
import cgi
import json
import os
import tempfile
import time
from http.server import HTTPServer, BaseHTTPRequestHandler
from faster_whisper import WhisperModel

model = None


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
            segments, info = model.transcribe(tmp_path, beam_size=5, temperature=0.0)
            
            text_parts = []
            seg_list = []
            for seg in segments:
                text_parts.append(seg.text)
                seg_list.append({'start': seg.start, 'end': seg.end, 'text': seg.text})

            response_format = form.getvalue('response_format', 'json')
            if response_format == 'verbose_json':
                self._json({
                    'text': ''.join(text_parts),
                    'segments': seg_list,
                    'language': info.language,
                    'duration': info.duration,
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
    global model
    p = argparse.ArgumentParser()
    p.add_argument('-m', '--model', default='base.en')
    p.add_argument('--host', default='0.0.0.0')
    p.add_argument('--port', type=int, default=8778)
    p.add_argument('--device', default='auto')
    p.add_argument('--compute-type', default='default')
    args = p.parse_args()

    print(f"Loading model: {args.model}")
    model = WhisperModel(args.model, device=args.device, compute_type=args.compute_type)
    print(f"Server running on {args.host}:{args.port}")
    HTTPServer((args.host, args.port), Handler).serve_forever()


if __name__ == '__main__':
    main()
