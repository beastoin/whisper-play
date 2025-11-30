```
~ make help
Usage: make [target]

Targets:
  all                  Build all components
  help                 Show this help message
  setup                Initialize all components
  setup-whispercpp     Clone whisper.cpp if not present
  setup-faster-whisper Set up faster-whisper Python environment
  setup-whisperx       Set up whisperx Python environment
  models               Download all models
  model-whispercpp     Download whispercpp model
  build                Build all servers
  whispercpp           Build whispercpp server
  faster-whisper       Set up faster-whisper server
  whisperx             Set up whisperx server
  run                  Run default server (whispercpp)
  run-whispercpp       Run whispercpp server
  run-faster-whisper   Run faster-whisper server
  run-whisperx         Run whisperx server
  test                 Run all tests
  test-whispercpp      Test whispercpp server (requires AUDIO_FILE)
  test-faster-whisper  Test faster-whisper server (requires AUDIO_FILE)
  test-whisperx        Test whisperx server (requires AUDIO_FILE)
  clean                Clean all build artifacts
  clean-whispercpp     Clean whispercpp build artifacts
  clean-faster-whisper Clean faster-whisper virtual environment
  clean-whisperx       Clean whisperx virtual environment
  distclean            Remove all build artifacts and environments (keeps submodules)
  install              Install whisper-server to PREFIX
```

```
~ make run-whispercpp
```

```
~ make test-whispercpp AUDIO_FILE=2025-11-28_10-04-59_session_1764299099.wav
```
