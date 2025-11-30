
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
Cloning whisper.cpp...
Cloning into 'whisper.cpp'...
remote: Enumerating objects: 27446, done.
remote: Counting objects: 100% (768/768), done.
remote: Compressing objects: 100% (244/244), done.
remote: Total 27446 (delta 587), reused 524 (delta 524), pack-reused 26678 (from 2)
Receiving objects: 100% (27446/27446), 28.54 MiB | 15.30 MiB/s, done.
Resolving deltas: 100% (19792/19792), done.
Downloading whispercpp model: base.en...
Downloading ggml model base.en from 'https://huggingface.co/ggerganov/whisper.cpp' ...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1370  100  1370    0     0   3029      0 --:--:-- --:--:-- --:--:--  3030
100  141M  100  141M    0     0  34.3M      0  0:00:04  0:00:04 --:--:-- 40.0M
Done! Model 'base.en' saved in '/Volumes/Ares/Developments/playground/whisper/whisper.cpp/models/ggml-base.en.bin'
You can now use it like this:

  $ whisper-cli -m /Volumes/Ares/Developments/playground/whisper/whisper.cpp/models/ggml-base.en.bin -f samples/jfk.wav

Building whisper-server...
-- The C compiler identification is AppleClang 17.0.0.17000319
-- The CXX compiler identification is AppleClang 17.0.0.17000319
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Found Git: /opt/homebrew/bin/git (found version "2.42.0")
-- The ASM compiler identification is AppleClang
-- Found assembler: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
-- Found Threads: TRUE
-- Warning: ccache not found - consider installing it for faster compilation or disable this warning with GGML_CCACHE=OFF
-- CMAKE_SYSTEM_PROCESSOR: arm64
-- GGML_SYSTEM_ARCH: ARM
-- Including CPU backend
-- Accelerate framework found
-- Found OpenMP_C: -Xclang -fopenmp (found version "5.1")
-- Found OpenMP_CXX: -Xclang -fopenmp (found version "5.1")
-- Found OpenMP: TRUE (found version "5.1")
-- ARM detected
-- Performing Test GGML_COMPILER_SUPPORTS_FP16_FORMAT_I3E
-- Performing Test GGML_COMPILER_SUPPORTS_FP16_FORMAT_I3E - Failed
CMake Warning at ggml/src/ggml-cpu/CMakeLists.txt:141 (message):
  ARM -march/-mcpu not found, -mcpu=native will be used
Call Stack (most recent call first):
  ggml/src/CMakeLists.txt:409 (ggml_add_cpu_backend_variant_impl)


-- Performing Test GGML_MACHINE_SUPPORTS_dotprod
-- Performing Test GGML_MACHINE_SUPPORTS_dotprod - Success
-- Performing Test GGML_MACHINE_SUPPORTS_i8mm
-- Performing Test GGML_MACHINE_SUPPORTS_i8mm - Failed
-- Performing Test GGML_MACHINE_SUPPORTS_noi8mm
-- Performing Test GGML_MACHINE_SUPPORTS_noi8mm - Success
-- Performing Test GGML_MACHINE_SUPPORTS_sve
-- Performing Test GGML_MACHINE_SUPPORTS_sve - Failed
-- Performing Test GGML_MACHINE_SUPPORTS_nosve
-- Performing Test GGML_MACHINE_SUPPORTS_nosve - Success
-- Performing Test GGML_MACHINE_SUPPORTS_sme
-- Performing Test GGML_MACHINE_SUPPORTS_sme - Failed
-- Performing Test GGML_MACHINE_SUPPORTS_nosme
-- Performing Test GGML_MACHINE_SUPPORTS_nosme - Success
-- ARM feature DOTPROD enabled
-- ARM feature FMA enabled
-- ARM feature FP16_VECTOR_ARITHMETIC enabled
-- Adding CPU backend variant ggml-cpu: -mcpu=native+dotprod+noi8mm+nosve+nosme
-- Looking for dgemm_
-- Looking for dgemm_ - found
-- Found BLAS: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.0.sdk/System/Library/Frameworks/Accelerate.framework
-- BLAS found, Libraries: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.0.sdk/System/Library/Frameworks/Accelerate.framework
-- BLAS found, Includes:
-- Including BLAS backend
-- Metal framework found
-- Including METAL backend
-- ggml version: 0.9.4
-- ggml commit:  19ceec8e
-- Configuring done (5.1s)
-- Generating done (0.1s)
-- Build files have been written to: /Volumes/Ares/Developments/playground/whisper/whisper.cpp/build
[  2%] Building C object ggml/src/CMakeFiles/ggml-base.dir/ggml.c.o
[  4%] Building CXX object ggml/src/CMakeFiles/ggml-base.dir/ggml.cpp.o
[  6%] Building C object ggml/src/CMakeFiles/ggml-base.dir/ggml-alloc.c.o
[  8%] Building CXX object ggml/src/CMakeFiles/ggml-base.dir/ggml-backend.cpp.o
[ 10%] Building CXX object ggml/src/CMakeFiles/ggml-base.dir/ggml-opt.cpp.o
[ 13%] Building CXX object ggml/src/CMakeFiles/ggml-base.dir/ggml-threading.cpp.o
[ 15%] Building C object ggml/src/CMakeFiles/ggml-base.dir/ggml-quants.c.o
[ 17%] Building CXX object ggml/src/CMakeFiles/ggml-base.dir/gguf.cpp.o
[ 19%] Linking CXX shared library libggml-base.dylib
[ 19%] Built target ggml-base
[ 21%] Generate assembly for embedded Metal library
Embedding Metal library
[ 23%] Building CXX object ggml/src/ggml-metal/CMakeFiles/ggml-metal.dir/ggml-metal.cpp.o
[ 26%] Building C object ggml/src/ggml-metal/CMakeFiles/ggml-metal.dir/ggml-metal-device.m.o
[ 28%] Building CXX object ggml/src/ggml-metal/CMakeFiles/ggml-metal.dir/ggml-metal-device.cpp.o
[ 30%] Building CXX object ggml/src/ggml-metal/CMakeFiles/ggml-metal.dir/ggml-metal-common.cpp.o
[ 32%] Building C object ggml/src/ggml-metal/CMakeFiles/ggml-metal.dir/ggml-metal-context.m.o
[ 34%] Building CXX object ggml/src/ggml-metal/CMakeFiles/ggml-metal.dir/ggml-metal-ops.cpp.o
[ 36%] Building ASM object ggml/src/ggml-metal/CMakeFiles/ggml-metal.dir/__/__/__/autogenerated/ggml-metal-embed.s.o
[ 39%] Linking CXX shared library libggml-metal.dylib
[ 39%] Built target ggml-metal
[ 41%] Building C object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/ggml-cpu.c.o
[ 43%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/ggml-cpu.cpp.o
[ 45%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/repack.cpp.o
[ 47%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/hbm.cpp.o
[ 50%] Building C object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/quants.c.o
[ 52%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/traits.cpp.o
[ 54%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/amx/amx.cpp.o
[ 56%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/amx/mmq.cpp.o
[ 58%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/binary-ops.cpp.o
[ 60%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/unary-ops.cpp.o
[ 63%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/vec.cpp.o
[ 65%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/ops.cpp.o
[ 67%] Building C object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/arch/arm/quants.c.o
[ 69%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/arch/arm/repack.cpp.o
[ 71%] Linking CXX shared library libggml-cpu.dylib
[ 71%] Built target ggml-cpu
[ 73%] Building CXX object ggml/src/ggml-blas/CMakeFiles/ggml-blas.dir/ggml-blas.cpp.o
[ 76%] Linking CXX shared library libggml-blas.dylib
[ 76%] Built target ggml-blas
[ 78%] Building CXX object ggml/src/CMakeFiles/ggml.dir/ggml-backend-reg.cpp.o
[ 80%] Linking CXX shared library libggml.dylib
[ 80%] Built target ggml
[ 82%] Building CXX object src/CMakeFiles/whisper.dir/whisper.cpp.o
[ 84%] Linking CXX shared library libwhisper.dylib
[ 84%] Built target whisper
[ 86%] Building CXX object examples/CMakeFiles/common.dir/common.cpp.o
[ 89%] Building CXX object examples/CMakeFiles/common.dir/common-ggml.cpp.o
[ 91%] Building CXX object examples/CMakeFiles/common.dir/common-whisper.cpp.o
[ 93%] Building CXX object examples/CMakeFiles/common.dir/grammar-parser.cpp.o
[ 95%] Linking CXX static library libcommon.a
[ 95%] Built target common
[ 97%] Building CXX object examples/server/CMakeFiles/whisper-server.dir/server.cpp.o
[100%] Linking CXX executable ../../bin/whisper-server
[100%] Built target whisper-server
Starting whisper-server on 0.0.0.0:8777...
whisper_init_from_file_with_params_no_state: loading model from 'models/ggml-base.en.bin'
whisper_init_with_params_no_state: use gpu    = 1
whisper_init_with_params_no_state: flash attn = 1
whisper_init_with_params_no_state: gpu_device = 0
whisper_init_with_params_no_state: dtw        = 0
ggml_metal_device_init: tensor API disabled for pre-M5 and pre-A19 devices
ggml_metal_library_init: using embedded metal library
ggml_metal_library_init: loaded in 0.022 sec
ggml_metal_device_init: GPU name:   Apple M1 Pro
ggml_metal_device_init: GPU family: MTLGPUFamilyApple7  (1007)
ggml_metal_device_init: GPU family: MTLGPUFamilyCommon3 (3003)
ggml_metal_device_init: GPU family: MTLGPUFamilyMetal4  (5002)
ggml_metal_device_init: simdgroup reduction   = true
ggml_metal_device_init: simdgroup matrix mul. = true
ggml_metal_device_init: has unified memory    = true
ggml_metal_device_init: has bfloat            = true
ggml_metal_device_init: has tensor            = false
ggml_metal_device_init: use residency sets    = true
ggml_metal_device_init: use shared buffers    = true
ggml_metal_device_init: recommendedMaxWorkingSetSize  = 12713.12 MB
whisper_init_with_params_no_state: devices    = 3
whisper_init_with_params_no_state: backends   = 3
whisper_model_load: loading model
whisper_model_load: n_vocab       = 51864
whisper_model_load: n_audio_ctx   = 1500
whisper_model_load: n_audio_state = 512
whisper_model_load: n_audio_head  = 8
whisper_model_load: n_audio_layer = 6
whisper_model_load: n_text_ctx    = 448
whisper_model_load: n_text_state  = 512
whisper_model_load: n_text_head   = 8
whisper_model_load: n_text_layer  = 6
whisper_model_load: n_mels        = 80
whisper_model_load: ftype         = 1
whisper_model_load: qntvr         = 0
whisper_model_load: type          = 2 (base)
whisper_model_load: adding 1607 extra tokens
whisper_model_load: n_langs       = 99
whisper_model_load:        Metal total size =   147.37 MB
whisper_model_load: model size    =  147.37 MB
whisper_backend_init_gpu: device 0: Metal (type: 1)
whisper_backend_init_gpu: found GPU device 0: Metal (type: 1, cnt: 0)
whisper_backend_init_gpu: using Metal backend
ggml_metal_init: allocating
ggml_metal_init: found device: Apple M1 Pro
ggml_metal_init: picking default device: Apple M1 Pro
ggml_metal_init: use fusion         = true
ggml_metal_init: use concurrency    = true
ggml_metal_init: use graph optimize = true
whisper_backend_init: using BLAS backend
whisper_init_state: kv self size  =    6.29 MB
whisper_init_state: kv cross size =   18.87 MB
whisper_init_state: kv pad  size  =    3.15 MB
whisper_init_state: compute buffer (conv)   =   17.24 MB
whisper_init_state: compute buffer (encode) =   26.31 MB
whisper_init_state: compute buffer (cross)  =   10.81 MB
whisper_init_state: compute buffer (decode) =   97.29 MB

whisper server listening at http://0.0.0.0:8777

```

```
~ make test-whispercpp AUDIO_FILE=2025-11-28_10-04-59_session_1764299099.wav
curl http://127.0.0.1:8777/inference \
                -H "Content-Type: multipart/form-data" \
                -F file="@2025-11-28_10-04-59_session_1764299099.wav" \
                -F temperature="0.0" \
                -F temperature_inc="0.2" \
                -F response_format="verbose_json" | jq
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  574k  100 12053  100  562k  21983  1025k --:--:-- --:--:-- --:--:-- 1047k
{
  "task": "transcribe",
  "language": "english",
  "duration": 17.979999542236328,
  "text": " And so that's where the idea of building shared tools\n because no one right now in the site.\n That's so interesting.\n So basically you're like, we're going to cure all disease\n and they're like, can't be done.\n Why can't it be done?\n Well, because we don't have the tools.\n So that's right.\n One, two, three things here.\n",
  "segments": [
    {
      "id": 0,
      "text": " And so that's where the idea of building shared tools",
      "start": 0.0,
      "end": 4.0200000000000005,
      "tokens": [
        843,
        523,
        326,
        338,
        810,
        262,
        2126,
        286,
        2615,
        4888,
        4899
      ],
      "words": [
        {
          "word": " And",
          "start": 0.0,
          "end": 0.37,
          "t_dtw": -1,
          "probability": 0.2000686675310135
        },
        {
          "word": " so",
          "start": 0.37,
          "end": 0.61,
          "t_dtw": -1,
          "probability": 0.9652391076087952
        },
        {
          "word": " that",
          "start": 1.0,
          "end": 1.1,
          "t_dtw": -1,
          "probability": 0.877187192440033
        },
        {
          "word": "'s",
          "start": 1.1,
          "end": 1.32,
          "t_dtw": -1,
          "probability": 0.9809145331382751
        },
        {
          "word": " where",
          "start": 1.36,
          "end": 1.95,
          "t_dtw": -1,
          "probability": 0.9907617568969727
        },
        {
          "word": " the",
          "start": 1.95,
          "end": 2.32,
          "t_dtw": -1,
          "probability": 0.9917411208152771
        },
        {
          "word": " idea",
          "start": 2.32,
          "end": 2.84,
          "t_dtw": -1,
          "probability": 0.9891558885574341
        },
        {
          "word": " of",
          "start": 2.84,
          "end": 2.92,
          "t_dtw": -1,
          "probability": 0.9414417743682861
        },
        {
          "word": " building",
          "start": 2.92,
          "end": 3.37,
          "t_dtw": -1,
          "probability": 0.9228945970535278
        },
        {
          "word": " shared",
          "start": 3.37,
          "end": 3.7,
          "t_dtw": -1,
          "probability": 0.9572737216949463
        },
        {
          "word": " tools",
          "start": 3.71,
          "end": 3.99,
          "t_dtw": -1,
          "probability": 0.99388188123703
        }
      ],
      "temperature": 0.0,
      "avg_logprob": -0.16780352592468262,
      "no_speech_prob": 0.06848464906215668
    },
    {
      "id": 1,
      "text": " because no one right now in the site.",
      "start": 4.0200000000000005,
      "end": 5.6000000000000005,
      "tokens": [
        780,
        645,
        530,
        826,
        783,
        287,
        262,
        2524,
        13
      ],
      "words": [
        {
          "word": " because",
          "start": 4.0200000000000005,
          "end": 4.09,
          "t_dtw": -1,
          "probability": 0.3209359645843506
        },
        {
          "word": " no",
          "start": 4.17,
          "end": 4.4,
          "t_dtw": -1,
          "probability": 0.9016963243484497
        },
        {
          "word": " one",
          "start": 4.4,
          "end": 4.5600000000000005,
          "t_dtw": -1,
          "probability": 0.9842617511749268
        },
        {
          "word": " right",
          "start": 4.5600000000000005,
          "end": 4.76,
          "t_dtw": -1,
          "probability": 0.8810320496559143
        },
        {
          "word": " now",
          "start": 4.76,
          "end": 4.92,
          "t_dtw": -1,
          "probability": 0.932522177696228
        },
        {
          "word": " in",
          "start": 4.92,
          "end": 5.16,
          "t_dtw": -1,
          "probability": 0.7036958932876587
        },
        {
          "word": " the",
          "start": 5.16,
          "end": 5.2,
          "t_dtw": -1,
          "probability": 0.8135223984718323
        },
        {
          "word": " site",
          "start": 5.2,
          "end": 5.48,
          "t_dtw": -1,
          "probability": 0.24142418801784515
        },
        {
          "word": ".",
          "start": 5.48,
          "end": 5.6000000000000005,
          "t_dtw": -1,
          "probability": 0.5699535012245178
        }
      ],
      "temperature": 0.0,
      "avg_logprob": -0.3993569314479828,
      "no_speech_prob": 0.0
    },
    {
      "id": 2,
      "text": " That's so interesting.",
      "start": 5.6000000000000005,
      "end": 6.6000000000000005,
      "tokens": [
        1320,
        338,
        523,
        3499,
        13
      ],
      "words": [
        {
          "word": " That",
          "start": 5.6000000000000005,
          "end": 5.78,
          "t_dtw": -1,
          "probability": 0.5934122800827026
        },
        {
          "word": "'s",
          "start": 5.78,
          "end": 5.87,
          "t_dtw": -1,
          "probability": 0.9870159029960632
        },
        {
          "word": " so",
          "start": 5.87,
          "end": 5.96,
          "t_dtw": -1,
          "probability": 0.9906125068664551
        },
        {
          "word": " interesting",
          "start": 5.96,
          "end": 6.45,
          "t_dtw": -1,
          "probability": 0.9980373382568359
        },
        {
          "word": ".",
          "start": 6.6000000000000005,
          "end": 6.6000000000000005,
          "t_dtw": -1,
          "probability": 0.6926031112670898
        }
      ],
      "temperature": 0.0,
      "avg_logprob": -0.1522715836763382,
      "no_speech_prob": 0.06848464906215668
    },
    {
      "id": 3,
      "text": " So basically you're like, we're going to cure all disease",
      "start": 6.6000000000000005,
      "end": 9.08,
      "tokens": [
        1406,
        6209,
        345,
        821,
        588,
        11,
        356,
        821,
        1016,
        284,
        13996,
        477,
        4369
      ],
      "words": [
        {
          "word": " So",
          "start": 6.6000000000000005,
          "end": 6.72,
          "t_dtw": -1,
          "probability": 0.91172856092453
        },
        {
          "word": " basically",
          "start": 6.72,
          "end": 7.26,
          "t_dtw": -1,
          "probability": 0.8931430578231812
        },
        {
          "word": " you",
          "start": 7.26,
          "end": 7.44,
          "t_dtw": -1,
          "probability": 0.5614843964576721
        },
        {
          "word": "'re",
          "start": 7.6000000000000005,
          "end": 7.61,
          "t_dtw": -1,
          "probability": 0.9742579460144043
        },
        {
          "word": " like",
          "start": 7.62,
          "end": 7.86,
          "t_dtw": -1,
          "probability": 0.9660513401031494
        },
        {
          "word": ",",
          "start": 7.86,
          "end": 8.0,
          "t_dtw": -1,
          "probability": 0.45172420144081116
        },
        {
          "word": " we",
          "start": 8.0,
          "end": 8.08,
          "t_dtw": -1,
          "probability": 0.547736406326294
        },
        {
          "word": "'re",
          "start": 8.08,
          "end": 8.120000000000001,
          "t_dtw": -1,
          "probability": 0.9920021891593933
        },
        {
          "word": " going",
          "start": 8.22,
          "end": 8.38,
          "t_dtw": -1,
          "probability": 0.7647432088851929
        },
        {
          "word": " to",
          "start": 8.41,
          "end": 8.48,
          "t_dtw": -1,
          "probability": 0.9965954422950745
        },
        {
          "word": " cure",
          "start": 8.48,
          "end": 8.56,
          "t_dtw": -1,
          "probability": 0.4439636170864105
        },
        {
          "word": " all",
          "start": 8.75,
          "end": 8.76,
          "t_dtw": -1,
          "probability": 0.9648415446281433
        },
        {
          "word": " disease",
          "start": 8.76,
          "end": 9.08,
          "t_dtw": -1,
          "probability": 0.555180013179779
        }
      ],
      "temperature": 0.0,
      "avg_logprob": -0.3042905628681183,
      "no_speech_prob": 0.06848464906215668
    },
    {
      "id": 4,
      "text": " and they're like, can't be done.",
      "start": 9.08,
      "end": 11.0,
      "tokens": [
        290,
        484,
        821,
        588,
        11,
        460,
        470,
        307,
        1760,
        13
      ],
      "words": [
        {
          "word": " and",
          "start": 9.08,
          "end": 9.200000000000001,
          "t_dtw": -1,
          "probability": 0.7325819134712219
        },
        {
          "word": " they",
          "start": 9.200000000000001,
          "end": 9.34,
          "t_dtw": -1,
          "probability": 0.9509435296058655
        },
        {
          "word": "'re",
          "start": 9.34,
          "end": 9.44,
          "t_dtw": -1,
          "probability": 0.9858888387680054
        },
        {
          "word": " like",
          "start": 9.44,
          "end": 9.55,
          "t_dtw": -1,
          "probability": 0.9876712560653687
        },
        {
          "word": ",",
          "start": 9.620000000000001,
          "end": 9.8,
          "t_dtw": -1,
          "probability": 0.5865861177444458
        },
        {
          "word": " can",
          "start": 9.8,
          "end": 10.01,
          "t_dtw": -1,
          "probability": 0.2918231189250946
        },
        {
          "word": "'t",
          "start": 10.01,
          "end": 10.16,
          "t_dtw": -1,
          "probability": 0.9803515672683716
        },
        {
          "word": " be",
          "start": 10.16,
          "end": 10.700000000000001,
          "t_dtw": -1,
          "probability": 0.8028607368469238
        },
        {
          "word": " done",
          "start": 10.77,
          "end": 10.92,
          "t_dtw": -1,
          "probability": 0.8715079426765442
        },
        {
          "word": ".",
          "start": 10.92,
          "end": 11.0,
          "t_dtw": -1,
          "probability": 0.6123963594436646
        }
      ],
      "temperature": 0.0,
      "avg_logprob": -0.2745877206325531,
      "no_speech_prob": 0.0
    },
    {
      "id": 5,
      "text": " Why can't it be done?",
      "start": 11.0,
      "end": 12.0,
      "tokens": [
        4162,
        460,
        470,
        340,
        307,
        1760,
        30
      ],
      "words": [
        {
          "word": " Why",
          "start": 11.0,
          "end": 11.15,
          "t_dtw": -1,
          "probability": 0.9946603775024414
        },
        {
          "word": " can",
          "start": 11.15,
          "end": 11.290000000000001,
          "t_dtw": -1,
          "probability": 0.9915387630462646
        },
        {
          "word": "'t",
          "start": 11.3,
          "end": 11.4,
          "t_dtw": -1,
          "probability": 0.9565081000328064
        },
        {
          "word": " it",
          "start": 11.4,
          "end": 11.5,
          "t_dtw": -1,
          "probability": 0.8204997777938843
        },
        {
          "word": " be",
          "start": 11.5,
          "end": 11.6,
          "t_dtw": -1,
          "probability": 0.9966981410980225
        },
        {
          "word": " done",
          "start": 11.6,
          "end": 11.81,
          "t_dtw": -1,
          "probability": 0.9969871044158936
        },
        {
          "word": "?",
          "start": 12.0,
          "end": 12.0,
          "t_dtw": -1,
          "probability": 0.8732858896255493
        }
      ],
      "temperature": 0.0,
      "avg_logprob": -0.04974699020385742,
      "no_speech_prob": 0.06848464906215668
    },
    {
      "id": 6,
      "text": " Well, because we don't have the tools.",
      "start": 12.0,
      "end": 14.0,
      "tokens": [
        3894,
        11,
        780,
        356,
        836,
        470,
        423,
        262,
        4899,
        13
      ],
      "words": [
        {
          "word": " Well",
          "start": 12.0,
          "end": 12.22,
          "t_dtw": -1,
          "probability": 0.571015477180481
        },
        {
          "word": ",",
          "start": 12.22,
          "end": 12.33,
          "t_dtw": -1,
          "probability": 0.7610835433006287
        },
        {
          "word": " because",
          "start": 12.33,
          "end": 12.72,
          "t_dtw": -1,
          "probability": 0.8520984053611755
        },
        {
          "word": " we",
          "start": 12.72,
          "end": 12.83,
          "t_dtw": -1,
          "probability": 0.9625843167304993
        },
        {
          "word": " don",
          "start": 13.0,
          "end": 13.0,
          "t_dtw": -1,
          "probability": 0.5218458771705627
        },
        {
          "word": "'t",
          "start": 13.02,
          "end": 13.11,
          "t_dtw": -1,
          "probability": 0.9996147751808167
        },
        {
          "word": " have",
          "start": 13.11,
          "end": 13.32,
          "t_dtw": -1,
          "probability": 0.9537172317504883
        },
        {
          "word": " the",
          "start": 13.32,
          "end": 13.5,
          "t_dtw": -1,
          "probability": 0.9488328099250793
        },
        {
          "word": " tools",
          "start": 13.5,
          "end": 13.77,
          "t_dtw": -1,
          "probability": 0.9986562132835388
        },
        {
          "word": ".",
          "start": 13.780000000000001,
          "end": 13.950000000000001,
          "t_dtw": -1,
          "probability": 0.5692386031150818
        }
      ],
      "temperature": 0.0,
      "avg_logprob": -0.21336521208286285,
      "no_speech_prob": 0.06848464906215668
    },
    {
      "id": 7,
      "text": " So that's right.",
      "start": 14.0,
      "end": 15.0,
      "tokens": [
        1406,
        326,
        338,
        826,
        13
      ],
      "words": [
        {
          "word": " So",
          "start": 14.0,
          "end": 14.120000000000001,
          "t_dtw": -1,
          "probability": 0.4247807562351227
        },
        {
          "word": " that",
          "start": 14.120000000000001,
          "end": 14.370000000000001,
          "t_dtw": -1,
          "probability": 0.8807665705680847
        },
        {
          "word": "'s",
          "start": 14.370000000000001,
          "end": 14.49,
          "t_dtw": -1,
          "probability": 0.9971088171005249
        },
        {
          "word": " right",
          "start": 14.49,
          "end": 14.8,
          "t_dtw": -1,
          "probability": 0.8916333317756653
        },
        {
          "word": ".",
          "start": 15.0,
          "end": 15.0,
          "t_dtw": -1,
          "probability": 0.7697744369506836
        }
      ],
      "temperature": 0.0,
      "avg_logprob": -0.22706635296344757,
      "no_speech_prob": 0.06848464906215668
    },
    {
      "id": 8,
      "text": " One, two, three things here.",
      "start": 15.0,
      "end": 16.0,
      "tokens": [
        1881,
        11,
        734,
        11,
        1115,
        1243,
        994,
        13
      ],
      "words": [
        {
          "word": " One",
          "start": 15.0,
          "end": 15.1,
          "t_dtw": -1,
          "probability": 0.7888607382774353
        },
        {
          "word": ",",
          "start": 15.1,
          "end": 15.17,
          "t_dtw": -1,
          "probability": 0.670770525932312
        },
        {
          "word": " two",
          "start": 15.17,
          "end": 15.27,
          "t_dtw": -1,
          "probability": 0.9968977570533752
        },
        {
          "word": ",",
          "start": 15.27,
          "end": 15.34,
          "t_dtw": -1,
          "probability": 0.8765048384666443
        },
        {
          "word": " three",
          "start": 15.34,
          "end": 15.51,
          "t_dtw": -1,
          "probability": 0.9277613759040833
        },
        {
          "word": " things",
          "start": 15.51,
          "end": 15.72,
          "t_dtw": -1,
          "probability": 0.8344538807868958
        },
        {
          "word": " here",
          "start": 15.72,
          "end": 15.860000000000001,
          "t_dtw": -1,
          "probability": 0.9659574031829834
        },
        {
          "word": ".",
          "start": 16.0,
          "end": 16.0,
          "t_dtw": -1,
          "probability": 0.9917373657226563
        }
      ],
      "temperature": 0.0,
      "avg_logprob": -0.11892276257276535,
      "no_speech_prob": 0.06848464906215668
    }
  ],
  "detected_language": "tajik",
  "detected_language_probability": 0.010004866868257523,
  "language_probabilities": {
    "en": 0.01000398863106966,
    "zh": 0.010004179552197456,
    "de": 0.00999041274189949,
    "es": 0.010004046373069286,
    "ru": 0.010004561394453049,
    "ko": 0.009989955462515354,
    "fr": 0.009990870021283627,
    "ja": 0.010004446841776371,
    "pt": 0.010003454983234406,
    "tr": 0.010004294104874134,
    "pl": 0.010004275478422642,
    "ca": 0.009990698657929897,
    "nl": 0.010004408657550812,
    "ar": 0.009991098195314407,
    "sv": 0.010003435425460339,
    "it": 0.009990564547479153,
    "id": 0.009990602731704712,
    "hi": 0.01000439003109932,
    "fi": 0.01000452321022749,
    "vi": 0.01000435184687376,
    "he": 0.01000335905700922,
    "uk": 0.009990316815674305,
    "el": 0.00999085046350956,
    "ms": 0.009990736842155457,
    "cs": 0.009991003200411797,
    "ro": 0.010004542768001556,
    "da": 0.010004064999520779,
    "hu": 0.009990946389734745,
    "ta": 0.010003874078392982,
    "no": 0.010003684088587761,
    "th": 0.010004255920648575,
    "ur": 0.010004103183746338,
    "hr": 0.010004217736423016,
    "bg": 0.010004313662648201,
    "lt": 0.009989631362259388,
    "la": 0.010004294104874134,
    "mi": 0.009990374557673931,
    "ml": 0.00999071728438139,
    "cy": 0.009990736842155457,
    "sk": 0.010004294104874134,
    "te": 0.010004790499806404,
    "fa": 0.010004179552197456,
    "lv": 0.01000439003109932,
    "bn": 0.010003168135881424,
    "sr": 0.01000398863106966,
    "az": 0.01000398863106966,
    "sl": 0.009990736842155457,
    "kn": 0.00999067910015583,
    "et": 0.010004199109971523,
    "mk": 0.009990698657929897,
    "br": 0.00999071728438139,
    "eu": 0.010003454983234406,
    "is": 0.009990526363253593,
    "hy": 0.010004446841776371,
    "ne": 0.010004428215324879,
    "mn": 0.010004313662648201,
    "bs": 0.01000452321022749,
    "kk": 0.010004103183746338,
    "sq": 0.01000402681529522,
    "sw": 0.010004637762904167,
    "gl": 0.010004237294197083,
    "mr": 0.010004103183746338,
    "pa": 0.010004294104874134,
    "si": 0.010004294104874134,
    "km": 0.009991041384637356,
    "sn": 0.010004332289099693,
    "yo": 0.00999067910015583,
    "so": 0.009990870021283627,
    "af": 0.010003569535911083,
    "oc": 0.010004255920648575,
    "ka": 0.01000398863106966,
    "be": 0.010004504583775997,
    "tg": 0.010004866868257523,
    "sd": 0.01000452321022749,
    "gu": 0.010004542768001556,
    "am": 0.010004217736423016,
    "yi": 0.009990812279284,
    "lo": 0.009990736842155457,
    "uz": 0.009990736842155457,
    "fo": 0.01000452321022749,
    "ht": 0.010003549978137016,
    "ps": 0.010003073140978813,
    "tk": 0.010004657320678234,
    "nn": 0.010004790499806404,
    "mt": 0.010004332289099693,
    "sa": 0.009990755468606949,
    "lb": 0.010004619136452675,
    "my": 0.010004199109971523,
    "bo": 0.010004542768001556,
    "tl": 0.010004428215324879,
    "mg": 0.010004141367971897,
    "as": 0.010004275478422642,
    "tt": 0.009990469552576542,
    "haw": 0.010004313662648201,
    "ln": 0.010003149509429932,
    "ha": 0.010004561394453049,
    "ba": 0.009990946389734745,
    "jw": 0.010004141367971897,
    "su": 0.009990870021283627,
    "yue": 0.010004179552197456
  }
}
~
~ make test-whispercpp AUDIO_FILE=2025-11-28_10-04-59_session_1764299099.wav
curl http://127.0.0.1:8777/inference \
                -H "Content-Type: multipart/form-data" \
                -F file="@2025-11-28_10-04-59_session_1764299099.wav" \
                -F temperature="0.0" \
                -F temperature_inc="0.2" \
                -F response_format="verbose_json" | jq
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  574k  100 12053  100  562k  28024  1307k --:--:-- --:--:-- --:--:-- 1332k
{
  "task": "transcribe",
  "language": "english",
  "duration": 17.979999542236328,
  "text": " And so that's where the idea of building shared tools\n because no one right now in the site.\n That's so interesting.\n So basically you're like, we're going to cure all disease\n and they're like, can't be done.\n Why can't it be done?\n Well, because we don't have the tools.\n So that's right.\n One, two, three things here.\n",
  "segments": [
    {
      "id": 0,
      "text": " And so that's where the idea of building shared tools",
      "start": 0.0,
      "end": 4.0200000000000005,
      "tokens": [
        843,
        523,
        326,
        338,
        810,
        262,
        2126,
        286,
        2615,
        4888,
        4899
      ],
      "words": [
        {
          "word": " And",
          "start": 0.0,
          "end": 0.37,
          "t_dtw": -1,
          "probability": 0.2000686675310135
        },
        {
          "word": " so",
          "start": 0.37,
          "end": 0.61,
          "t_dtw": -1,
          "probability": 0.9652391076087952
        },
        {
          "word": " that",
          "start": 1.0,
          "end": 1.1,
          "t_dtw": -1,
          "probability": 0.877187192440033
        },
        {
          "word": "'s",
          "start": 1.1,
          "end": 1.32,
          "t_dtw": -1,
          "probability": 0.9809145331382751
        },
        {
          "word": " where",
          "start": 1.36,
          "end": 1.95,
          "t_dtw": -1,
          "probability": 0.9907617568969727
        },
        {
          "word": " the",
          "start": 1.95,
          "end": 2.32,
          "t_dtw": -1,
          "probability": 0.9917411208152771
        },
        {
          "word": " idea",
          "start": 2.32,
          "end": 2.84,
          "t_dtw": -1,
          "probability": 0.9891558885574341
        },
        {
          "word": " of",
          "start": 2.84,
          "end": 2.92,
          "t_dtw": -1,
          "probability": 0.9414417743682861
        },
        {
          "word": " building",
          "start": 2.92,
          "end": 3.37,
          "t_dtw": -1,
          "probability": 0.9228945970535278
        },
        {
          "word": " shared",
          "start": 3.37,
          "end": 3.7,
          "t_dtw": -1,
          "probability": 0.9572737216949463
        },
        {
          "word": " tools",
          "start": 3.71,
          "end": 3.99,
          "t_dtw": -1,
          "probability": 0.99388188123703
        }
      ],
      "temperature": 0.0,
      "avg_logprob": -0.16780352592468262,
      "no_speech_prob": 0.06848464906215668
    },
    {
      "id": 1,
      "text": " because no one right now in the site.",
      "start": 4.0200000000000005,
      "end": 5.6000000000000005,
      "tokens": [
        780,
        645,
        530,
        826,
        783,
        287,
        262,
        2524,
        13
      ],
      "words": [
        {
          "word": " because",
          "start": 4.0200000000000005,
          "end": 4.09,
          "t_dtw": -1,
          "probability": 0.3209359645843506
        },
        {
          "word": " no",
          "start": 4.17,
          "end": 4.4,
          "t_dtw": -1,
          "probability": 0.9016963243484497
        },
        {
          "word": " one",
          "start": 4.4,
          "end": 4.5600000000000005,
          "t_dtw": -1,
          "probability": 0.9842617511749268
        },
        {
          "word": " right",
          "start": 4.5600000000000005,
          "end": 4.76,
          "t_dtw": -1,
          "probability": 0.8810320496559143
        },
        {
          "word": " now",
          "start": 4.76,
          "end": 4.92,
          "t_dtw": -1,
          "probability": 0.932522177696228
        },
        {
          "word": " in",
          "start": 4.92,
          "end": 5.16,
          "t_dtw": -1,
          "probability": 0.7036958932876587
        },
        {
          "word": " the",
          "start": 5.16,
          "end": 5.2,
          "t_dtw": -1,
          "probability": 0.8135223984718323
        },
        {
          "word": " site",
          "start": 5.2,
          "end": 5.48,
          "t_dtw": -1,
          "probability": 0.24142418801784515
        },
        {
          "word": ".",
          "start": 5.48,
          "end": 5.6000000000000005,
          "t_dtw": -1,
          "probability": 0.5699535012245178
        }
      ],
      "temperature": 0.0,
      "avg_logprob": -0.3993569314479828,
      "no_speech_prob": 0.0
    },
    {
      "id": 2,
      "text": " That's so interesting.",
      "start": 5.6000000000000005,
      "end": 6.6000000000000005,
      "tokens": [
        1320,
        338,
        523,
        3499,
        13
      ],
      "words": [
        {
          "word": " That",
          "start": 5.6000000000000005,
          "end": 5.78,
          "t_dtw": -1,
          "probability": 0.5934122800827026
        },
        {
          "word": "'s",
          "start": 5.78,
          "end": 5.87,
          "t_dtw": -1,
          "probability": 0.9870159029960632
        },
        {
          "word": " so",
          "start": 5.87,
          "end": 5.96,
          "t_dtw": -1,
          "probability": 0.9906125068664551
        },
        {
          "word": " interesting",
          "start": 5.96,
          "end": 6.45,
          "t_dtw": -1,
          "probability": 0.9980373382568359
        },
        {
          "word": ".",
          "start": 6.6000000000000005,
          "end": 6.6000000000000005,
          "t_dtw": -1,
          "probability": 0.6926031112670898
        }
      ],
      "temperature": 0.0,
      "avg_logprob": -0.1522715836763382,
      "no_speech_prob": 0.06848464906215668
    },
    {
      "id": 3,
      "text": " So basically you're like, we're going to cure all disease",
      "start": 6.6000000000000005,
      "end": 9.08,
      "tokens": [
        1406,
        6209,
        345,
        821,
        588,
        11,
        356,
        821,
        1016,
        284,
        13996,
        477,
        4369
      ],
      "words": [
        {
          "word": " So",
          "start": 6.6000000000000005,
          "end": 6.72,
          "t_dtw": -1,
          "probability": 0.91172856092453
        },
        {
          "word": " basically",
          "start": 6.72,
          "end": 7.26,
          "t_dtw": -1,
          "probability": 0.8931430578231812
        },
        {
          "word": " you",
          "start": 7.26,
          "end": 7.44,
          "t_dtw": -1,
          "probability": 0.5614843964576721
        },
        {
          "word": "'re",
          "start": 7.6000000000000005,
          "end": 7.61,
          "t_dtw": -1,
          "probability": 0.9742579460144043
        },
        {
          "word": " like",
          "start": 7.62,
          "end": 7.86,
          "t_dtw": -1,
          "probability": 0.9660513401031494
        },
        {
          "word": ",",
          "start": 7.86,
          "end": 8.0,
          "t_dtw": -1,
          "probability": 0.45172420144081116
        },
        {
          "word": " we",
          "start": 8.0,
          "end": 8.08,
          "t_dtw": -1,
          "probability": 0.547736406326294
        },
        {
          "word": "'re",
          "start": 8.08,
          "end": 8.120000000000001,
          "t_dtw": -1,
          "probability": 0.9920021891593933
        },
        {
          "word": " going",
          "start": 8.22,
          "end": 8.38,
          "t_dtw": -1,
          "probability": 0.7647432088851929
        },
        {
          "word": " to",
          "start": 8.41,
          "end": 8.48,
          "t_dtw": -1,
          "probability": 0.9965954422950745
        },
        {
          "word": " cure",
          "start": 8.48,
          "end": 8.56,
          "t_dtw": -1,
          "probability": 0.4439636170864105
        },
        {
          "word": " all",
          "start": 8.75,
          "end": 8.76,
          "t_dtw": -1,
          "probability": 0.9648415446281433
        },
        {
          "word": " disease",
          "start": 8.76,
          "end": 9.08,
          "t_dtw": -1,
          "probability": 0.555180013179779
        }
      ],
      "temperature": 0.0,
      "avg_logprob": -0.3042905628681183,
      "no_speech_prob": 0.06848464906215668
    },
    {
      "id": 4,
      "text": " and they're like, can't be done.",
      "start": 9.08,
      "end": 11.0,
      "tokens": [
        290,
        484,
        821,
        588,
        11,
        460,
        470,
        307,
        1760,
        13
      ],
      "words": [
        {
          "word": " and",
          "start": 9.08,
          "end": 9.200000000000001,
          "t_dtw": -1,
          "probability": 0.7325819134712219
        },
        {
          "word": " they",
          "start": 9.200000000000001,
          "end": 9.34,
          "t_dtw": -1,
          "probability": 0.9509435296058655
        },
        {
          "word": "'re",
          "start": 9.34,
          "end": 9.44,
          "t_dtw": -1,
          "probability": 0.9858888387680054
        },
        {
          "word": " like",
          "start": 9.44,
          "end": 9.55,
          "t_dtw": -1,
          "probability": 0.9876712560653687
        },
        {
          "word": ",",
          "start": 9.620000000000001,
          "end": 9.8,
          "t_dtw": -1,
          "probability": 0.5865861177444458
        },
        {
          "word": " can",
          "start": 9.8,
          "end": 10.01,
          "t_dtw": -1,
          "probability": 0.2918231189250946
        },
        {
          "word": "'t",
          "start": 10.01,
          "end": 10.16,
          "t_dtw": -1,
          "probability": 0.9803515672683716
        },
        {
          "word": " be",
          "start": 10.16,
          "end": 10.700000000000001,
          "t_dtw": -1,
          "probability": 0.8028607368469238
        },
        {
          "word": " done",
          "start": 10.77,
          "end": 10.92,
          "t_dtw": -1,
          "probability": 0.8715079426765442
        },
        {
          "word": ".",
          "start": 10.92,
          "end": 11.0,
          "t_dtw": -1,
          "probability": 0.6123963594436646
        }
      ],
      "temperature": 0.0,
      "avg_logprob": -0.2745877206325531,
      "no_speech_prob": 0.0
    },
    {
      "id": 5,
      "text": " Why can't it be done?",
      "start": 11.0,
      "end": 12.0,
      "tokens": [
        4162,
        460,
        470,
        340,
        307,
        1760,
        30
      ],
      "words": [
        {
          "word": " Why",
          "start": 11.0,
          "end": 11.15,
          "t_dtw": -1,
          "probability": 0.9946603775024414
        },
        {
          "word": " can",
          "start": 11.15,
          "end": 11.290000000000001,
          "t_dtw": -1,
          "probability": 0.9915387630462646
        },
        {
          "word": "'t",
          "start": 11.3,
          "end": 11.4,
          "t_dtw": -1,
          "probability": 0.9565081000328064
        },
        {
          "word": " it",
          "start": 11.4,
          "end": 11.5,
          "t_dtw": -1,
          "probability": 0.8204997777938843
        },
        {
          "word": " be",
          "start": 11.5,
          "end": 11.6,
          "t_dtw": -1,
          "probability": 0.9966981410980225
        },
        {
          "word": " done",
          "start": 11.6,
          "end": 11.81,
          "t_dtw": -1,
          "probability": 0.9969871044158936
        },
        {
          "word": "?",
          "start": 12.0,
          "end": 12.0,
          "t_dtw": -1,
          "probability": 0.8732858896255493
        }
      ],
      "temperature": 0.0,
      "avg_logprob": -0.04974699020385742,
      "no_speech_prob": 0.06848464906215668
    },
    {
      "id": 6,
      "text": " Well, because we don't have the tools.",
      "start": 12.0,
      "end": 14.0,
      "tokens": [
        3894,
        11,
        780,
        356,
        836,
        470,
        423,
        262,
        4899,
        13
      ],
      "words": [
        {
          "word": " Well",
          "start": 12.0,
          "end": 12.22,
          "t_dtw": -1,
          "probability": 0.571015477180481
        },
        {
          "word": ",",
          "start": 12.22,
          "end": 12.33,
          "t_dtw": -1,
          "probability": 0.7610835433006287
        },
        {
          "word": " because",
          "start": 12.33,
          "end": 12.72,
          "t_dtw": -1,
          "probability": 0.8520984053611755
        },
        {
          "word": " we",
          "start": 12.72,
          "end": 12.83,
          "t_dtw": -1,
          "probability": 0.9625843167304993
        },
        {
          "word": " don",
          "start": 13.0,
          "end": 13.0,
          "t_dtw": -1,
          "probability": 0.5218458771705627
        },
        {
          "word": "'t",
          "start": 13.02,
          "end": 13.11,
          "t_dtw": -1,
          "probability": 0.9996147751808167
        },
        {
          "word": " have",
          "start": 13.11,
          "end": 13.32,
          "t_dtw": -1,
          "probability": 0.9537172317504883
        },
        {
          "word": " the",
          "start": 13.32,
          "end": 13.5,
          "t_dtw": -1,
          "probability": 0.9488328099250793
        },
        {
          "word": " tools",
          "start": 13.5,
          "end": 13.77,
          "t_dtw": -1,
          "probability": 0.9986562132835388
        },
        {
          "word": ".",
          "start": 13.780000000000001,
          "end": 13.950000000000001,
          "t_dtw": -1,
          "probability": 0.5692386031150818
        }
      ],
      "temperature": 0.0,
      "avg_logprob": -0.21336521208286285,
      "no_speech_prob": 0.06848464906215668
    },
    {
      "id": 7,
      "text": " So that's right.",
      "start": 14.0,
      "end": 15.0,
      "tokens": [
        1406,
        326,
        338,
        826,
        13
      ],
      "words": [
        {
          "word": " So",
          "start": 14.0,
          "end": 14.120000000000001,
          "t_dtw": -1,
          "probability": 0.4247807562351227
        },
        {
          "word": " that",
          "start": 14.120000000000001,
          "end": 14.370000000000001,
          "t_dtw": -1,
          "probability": 0.8807665705680847
        },
        {
          "word": "'s",
          "start": 14.370000000000001,
          "end": 14.49,
          "t_dtw": -1,
          "probability": 0.9971088171005249
        },
        {
          "word": " right",
          "start": 14.49,
          "end": 14.8,
          "t_dtw": -1,
          "probability": 0.8916333317756653
        },
        {
          "word": ".",
          "start": 15.0,
          "end": 15.0,
          "t_dtw": -1,
          "probability": 0.7697744369506836
        }
      ],
      "temperature": 0.0,
      "avg_logprob": -0.22706635296344757,
      "no_speech_prob": 0.06848464906215668
    },
    {
      "id": 8,
      "text": " One, two, three things here.",
      "start": 15.0,
      "end": 16.0,
      "tokens": [
        1881,
        11,
        734,
        11,
        1115,
        1243,
        994,
        13
      ],
      "words": [
        {
          "word": " One",
          "start": 15.0,
          "end": 15.1,
          "t_dtw": -1,
          "probability": 0.7888607382774353
        },
        {
          "word": ",",
          "start": 15.1,
          "end": 15.17,
          "t_dtw": -1,
          "probability": 0.670770525932312
        },
        {
          "word": " two",
          "start": 15.17,
          "end": 15.27,
          "t_dtw": -1,
          "probability": 0.9968977570533752
        },
        {
          "word": ",",
          "start": 15.27,
          "end": 15.34,
          "t_dtw": -1,
          "probability": 0.8765048384666443
        },
        {
          "word": " three",
          "start": 15.34,
          "end": 15.51,
          "t_dtw": -1,
          "probability": 0.9277613759040833
        },
        {
          "word": " things",
          "start": 15.51,
          "end": 15.72,
          "t_dtw": -1,
          "probability": 0.8344538807868958
        },
        {
          "word": " here",
          "start": 15.72,
          "end": 15.860000000000001,
          "t_dtw": -1,
          "probability": 0.9659574031829834
        },
        {
          "word": ".",
          "start": 16.0,
          "end": 16.0,
          "t_dtw": -1,
          "probability": 0.9917373657226563
        }
      ],
      "temperature": 0.0,
      "avg_logprob": -0.11892276257276535,
      "no_speech_prob": 0.06848464906215668
    }
  ],
  "detected_language": "tajik",
  "detected_language_probability": 0.010004866868257523,
  "language_probabilities": {
    "en": 0.01000398863106966,
    "zh": 0.010004179552197456,
    "de": 0.00999041274189949,
    "es": 0.010004046373069286,
    "ru": 0.010004561394453049,
    "ko": 0.009989955462515354,
    "fr": 0.009990870021283627,
    "ja": 0.010004446841776371,
    "pt": 0.010003454983234406,
    "tr": 0.010004294104874134,
    "pl": 0.010004275478422642,
    "ca": 0.009990698657929897,
    "nl": 0.010004408657550812,
    "ar": 0.009991098195314407,
    "sv": 0.010003435425460339,
    "it": 0.009990564547479153,
    "id": 0.009990602731704712,
    "hi": 0.01000439003109932,
    "fi": 0.01000452321022749,
    "vi": 0.01000435184687376,
    "he": 0.01000335905700922,
    "uk": 0.009990316815674305,
    "el": 0.00999085046350956,
    "ms": 0.009990736842155457,
    "cs": 0.009991003200411797,
    "ro": 0.010004542768001556,
    "da": 0.010004064999520779,
    "hu": 0.009990946389734745,
    "ta": 0.010003874078392982,
    "no": 0.010003684088587761,
    "th": 0.010004255920648575,
    "ur": 0.010004103183746338,
    "hr": 0.010004217736423016,
    "bg": 0.010004313662648201,
    "lt": 0.009989631362259388,
    "la": 0.010004294104874134,
    "mi": 0.009990374557673931,
    "ml": 0.00999071728438139,
    "cy": 0.009990736842155457,
    "sk": 0.010004294104874134,
    "te": 0.010004790499806404,
    "fa": 0.010004179552197456,
    "lv": 0.01000439003109932,
    "bn": 0.010003168135881424,
    "sr": 0.01000398863106966,
    "az": 0.01000398863106966,
    "sl": 0.009990736842155457,
    "kn": 0.00999067910015583,
    "et": 0.010004199109971523,
    "mk": 0.009990698657929897,
    "br": 0.00999071728438139,
    "eu": 0.010003454983234406,
    "is": 0.009990526363253593,
    "hy": 0.010004446841776371,
    "ne": 0.010004428215324879,
    "mn": 0.010004313662648201,
    "bs": 0.01000452321022749,
    "kk": 0.010004103183746338,
    "sq": 0.01000402681529522,
    "sw": 0.010004637762904167,
    "gl": 0.010004237294197083,
    "mr": 0.010004103183746338,
    "pa": 0.010004294104874134,
    "si": 0.010004294104874134,
    "km": 0.009991041384637356,
    "sn": 0.010004332289099693,
    "yo": 0.00999067910015583,
    "so": 0.009990870021283627,
    "af": 0.010003569535911083,
    "oc": 0.010004255920648575,
    "ka": 0.01000398863106966,
    "be": 0.010004504583775997,
    "tg": 0.010004866868257523,
    "sd": 0.01000452321022749,
    "gu": 0.010004542768001556,
    "am": 0.010004217736423016,
    "yi": 0.009990812279284,
    "lo": 0.009990736842155457,
    "uz": 0.009990736842155457,
    "fo": 0.01000452321022749,
    "ht": 0.010003549978137016,
    "ps": 0.010003073140978813,
    "tk": 0.010004657320678234,
    "nn": 0.010004790499806404,
    "mt": 0.010004332289099693,
    "sa": 0.009990755468606949,
    "lb": 0.010004619136452675,
    "my": 0.010004199109971523,
    "bo": 0.010004542768001556,
    "tl": 0.010004428215324879,
    "mg": 0.010004141367971897,
    "as": 0.010004275478422642,
    "tt": 0.009990469552576542,
    "haw": 0.010004313662648201,
    "ln": 0.010003149509429932,
    "ha": 0.010004561394453049,
    "ba": 0.009990946389734745,
    "jw": 0.010004141367971897,
    "su": 0.009990870021283627,
    "yue": 0.010004179552197456
  }
}
```
