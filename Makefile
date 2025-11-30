#-*-mode:makefile-gmake;indent-tabs-mode:t;tab-width:8;coding:utf-8-*-┐
#── vi: set noet ft=make ts=8 sw=8 fenc=utf-8 :vi ────────────────────┘
#
# Makefile for managing AI server infrastructure.
# Extensible to support multiple repositories (whisper.cpp, llama.cpp, etc.)

SHELL = /bin/bash
MAKEFLAGS += --no-builtin-rules

.SUFFIXES:
.DELETE_ON_ERROR:

#######################################
# Configuration
#######################################
PREFIX ?= /usr/local
BUILD_DIR ?= build

# whisper.cpp settings
WHISPERCPP_DIR := whisper.cpp
WHISPERCPP_MODEL ?= base.en
WHISPERCPP_HOST ?= 0.0.0.0
WHISPERCPP_PORT ?= 8777

# faster-whisper settings
PYTHON ?= python
FASTER_WHISPER_DIR := wrapper/faster-whisper
FASTER_WHISPER_SUBMODULE := faster-whisper
FASTER_WHISPER_VENV := $(FASTER_WHISPER_DIR)/.venv
FASTER_WHISPER_MODEL ?= base.en
FASTER_WHISPER_HOST ?= 0.0.0.0
FASTER_WHISPER_PORT ?= 8778
FASTER_WHISPER_DEVICE ?= auto
FASTER_WHISPER_COMPUTE_TYPE ?= default

# whisperx settings
WHISPERX_DIR := wrapper/whisperx
WHISPERX_SUBMODULE := whisperx
WHISPERX_VENV := $(WHISPERX_DIR)/.venv
WHISPERX_MODEL ?= base.en
WHISPERX_HOST ?= 0.0.0.0
WHISPERX_PORT ?= 8779
WHISPERX_DEVICE ?= auto
WHISPERX_COMPUTE_TYPE ?= auto
WHISPERX_VAD ?= false

#######################################
# Phony targets
#######################################
.PHONY: all
all: whispercpp faster-whisper whisperx  ## Build all components

.PHONY: help
help:  ## Show this help message
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  %-20s %s\n", $$1, $$2}'

#######################################
# Setup targets
#######################################
.PHONY: setup
setup: setup-whispercpp setup-faster-whisper setup-whisperx  ## Initialize all components

.PHONY: setup-whispercpp
setup-whispercpp:  ## Initialize whisper.cpp submodule
	@if [ ! -f "$(WHISPERCPP_DIR)/.git" ] && [ ! -d "$(WHISPERCPP_DIR)/.git" ]; then \
		echo "Initializing whisper.cpp submodule..."; \
		git submodule update --init $(WHISPERCPP_DIR); \
	else \
		echo "whisper.cpp submodule already initialized"; \
	fi

.PHONY: setup-faster-whisper
setup-faster-whisper:  ## Set up faster-whisper Python environment
	@if [ ! -f "$(FASTER_WHISPER_SUBMODULE)/.git" ] && [ ! -d "$(FASTER_WHISPER_SUBMODULE)/.git" ]; then \
		echo "Initializing faster-whisper submodule..."; \
		git submodule update --init $(FASTER_WHISPER_SUBMODULE); \
	fi
	@if [ ! -d "$(FASTER_WHISPER_VENV)" ]; then \
		echo "Creating faster-whisper virtual environment..."; \
		$(PYTHON) -m venv $(FASTER_WHISPER_VENV); \
		$(FASTER_WHISPER_VENV)/bin/pip install --upgrade pip; \
		$(FASTER_WHISPER_VENV)/bin/pip install -e $(FASTER_WHISPER_SUBMODULE); \
	else \
		echo "faster-whisper venv already exists"; \
	fi

.PHONY: setup-whisperx
setup-whisperx:  ## Set up whisperx Python environment
	@if [ ! -f "$(WHISPERX_SUBMODULE)/.git" ] && [ ! -d "$(WHISPERX_SUBMODULE)/.git" ]; then \
		echo "Initializing whisperx submodule..."; \
		git submodule update --init $(WHISPERX_SUBMODULE); \
	fi
	@if [ ! -d "$(WHISPERX_VENV)" ]; then \
		echo "Creating whisperx virtual environment..."; \
		$(PYTHON) -m venv $(WHISPERX_VENV); \
		$(WHISPERX_VENV)/bin/pip install --upgrade pip; \
		$(WHISPERX_VENV)/bin/pip install -e $(WHISPERX_SUBMODULE); \
	else \
		echo "whisperx venv already exists"; \
	fi

#######################################
# Model targets
#######################################
.PHONY: models
models: model-whispercpp  ## Download all models

.PHONY: model-whispercpp
model-whispercpp: setup-whispercpp  ## Download whispercpp model
	@if [ ! -f "$(WHISPERCPP_DIR)/models/ggml-$(WHISPERCPP_MODEL).bin" ]; then \
		echo "Downloading whispercpp model: $(WHISPERCPP_MODEL)..."; \
		cd $(WHISPERCPP_DIR) && sh ./models/download-ggml-model.sh $(WHISPERCPP_MODEL); \
	else \
		echo "Whispercpp model $(WHISPERCPP_MODEL) already exists"; \
	fi

#######################################
# Build targets
#######################################
.PHONY: build
build: whispercpp faster-whisper whisperx  ## Build all servers

.PHONY: whispercpp
whispercpp: $(WHISPERCPP_DIR)/build/bin/whisper-server  ## Build whispercpp server

$(WHISPERCPP_DIR)/build/bin/whisper-server: setup-whispercpp model-whispercpp
	@echo "Building whisper-server..."
	@cd $(WHISPERCPP_DIR) && cmake -B build
	@cd $(WHISPERCPP_DIR) && cmake --build build --target whisper-server

.PHONY: faster-whisper
faster-whisper: setup-faster-whisper  ## Set up faster-whisper server
	@echo "faster-whisper is ready (Python-based, no build needed)"

.PHONY: whisperx
whisperx: setup-whisperx  ## Set up whisperx server
	@echo "whisperx is ready (Python-based, no build needed)"

#######################################
# Run targets
#######################################
.PHONY: run
run: run-whispercpp  ## Run default server (whispercpp)

.PHONY: run-whispercpp
run-whispercpp: whispercpp  ## Run whispercpp server
	@echo "Starting whisper-server on $(WHISPERCPP_HOST):$(WHISPERCPP_PORT)..."
	@cd $(WHISPERCPP_DIR) && \
		export DYLD_LIBRARY_PATH="build/src:$$DYLD_LIBRARY_PATH" && \
		./build/bin/whisper-server \
			-m models/ggml-$(WHISPERCPP_MODEL).bin \
			--host $(WHISPERCPP_HOST) \
			--port $(WHISPERCPP_PORT)

.PHONY: run-faster-whisper
run-faster-whisper: faster-whisper  ## Run faster-whisper server
	@echo "Starting faster-whisper-server on $(FASTER_WHISPER_HOST):$(FASTER_WHISPER_PORT)..."
	$(FASTER_WHISPER_VENV)/bin/python $(FASTER_WHISPER_DIR)/server.py \
		--model $(FASTER_WHISPER_MODEL) \
		--host $(FASTER_WHISPER_HOST) \
		--port $(FASTER_WHISPER_PORT) \
		--device $(FASTER_WHISPER_DEVICE) \
		--compute-type $(FASTER_WHISPER_COMPUTE_TYPE)

.PHONY: run-whisperx
run-whisperx: whisperx  ## Run whisperx server
	@echo "Starting whisperx-server on $(WHISPERX_HOST):$(WHISPERX_PORT)..."
	$(WHISPERX_VENV)/bin/python $(WHISPERX_DIR)/server.py \
		--model $(WHISPERX_MODEL) \
		--host $(WHISPERX_HOST) \
		--port $(WHISPERX_PORT) \
		--device $(WHISPERX_DEVICE) \
		--compute-type $(WHISPERX_COMPUTE_TYPE) \
		$(if $(filter false,$(WHISPERX_VAD)),--no-vad)

#######################################
# Test targets
#######################################
.PHONY: test
test: test-whispercpp  ## Run all tests

.PHONY: test-whispercpp
test-whispercpp:  ## Test whispercpp server (requires AUDIO_FILE)
	@if [ -z "$(AUDIO_FILE)" ]; then \
		echo "Usage: make test-whispercpp AUDIO_FILE=/path/to/audio.wav"; \
		exit 1; \
	fi
	curl http://127.0.0.1:$(WHISPERCPP_PORT)/inference \
		-H "Content-Type: multipart/form-data" \
		-F file="@$(AUDIO_FILE)" \
		-F temperature="0.0" \
		-F temperature_inc="0.2" \
		-F response_format="verbose_json" | jq

.PHONY: test-faster-whisper
test-faster-whisper:  ## Test faster-whisper server (requires AUDIO_FILE)
	@if [ -z "$(AUDIO_FILE)" ]; then \
		echo "Usage: make test-faster-whisper AUDIO_FILE=/path/to/audio.wav"; \
		exit 1; \
	fi
	curl http://127.0.0.1:$(FASTER_WHISPER_PORT)/inference \
		-H "Content-Type: multipart/form-data" \
		-F file="@$(AUDIO_FILE)" \
		-F temperature="0.0" \
		-F response_format="verbose_json" | jq

.PHONY: test-whisperx
test-whisperx:  ## Test whisperx server (requires AUDIO_FILE)
	@if [ -z "$(AUDIO_FILE)" ]; then \
		echo "Usage: make test-whisperx AUDIO_FILE=/path/to/audio.wav"; \
		exit 1; \
	fi
	curl http://127.0.0.1:$(WHISPERX_PORT)/inference \
		-H "Content-Type: multipart/form-data" \
		-F file="@$(AUDIO_FILE)" \
		-F align="false" \
		-F response_format="verbose_json" | jq

#######################################
# Clean targets
#######################################
.PHONY: clean
clean: clean-whispercpp clean-faster-whisper clean-whisperx  ## Clean all build artifacts

.PHONY: clean-whispercpp
clean-whispercpp:  ## Clean whispercpp build artifacts
	@if [ -d "$(WHISPERCPP_DIR)/build" ]; then \
		echo "Cleaning whisper.cpp build..."; \
		rm -rf $(WHISPERCPP_DIR)/build; \
	fi

.PHONY: clean-faster-whisper
clean-faster-whisper:  ## Clean faster-whisper virtual environment
	@if [ -d "$(FASTER_WHISPER_VENV)" ]; then \
		echo "Cleaning faster-whisper venv..."; \
		rm -rf $(FASTER_WHISPER_VENV); \
	fi

.PHONY: clean-whisperx
clean-whisperx:  ## Clean whisperx virtual environment
	@if [ -d "$(WHISPERX_VENV)" ]; then \
		echo "Cleaning whisperx venv..."; \
		rm -rf $(WHISPERX_VENV); \
	fi

.PHONY: distclean
distclean:  ## Remove all build artifacts and environments (keeps submodules)
	@echo "Removing all environments and builds..."
	@rm -rf $(WHISPERCPP_DIR)/build
	@rm -rf $(FASTER_WHISPER_VENV)
	@rm -rf $(WHISPERX_VENV)

.PHONY: submodule-clean
submodule-clean:  ## Deinitialize all submodules
	@echo "Deinitializing submodules..."
	@git submodule deinit -f $(WHISPERCPP_DIR) 2>/dev/null || true
	@git submodule deinit -f $(FASTER_WHISPER_SUBMODULE) 2>/dev/null || true
	@git submodule deinit -f $(WHISPERX_SUBMODULE) 2>/dev/null || true

#######################################
# Install targets
#######################################
.PHONY: install
install: whispercpp  ## Install whisper-server to PREFIX
	@mkdir -p $(PREFIX)/bin
	@echo "Installing whisper-server to $(PREFIX)/bin..."
	@cp $(WHISPERCPP_DIR)/build/bin/whisper-server $(PREFIX)/bin/whisper-server
	@cp $(WHISPERCPP_DIR)/build/src/libwhisper*.dylib $(PREFIX)/lib/ 2>/dev/null || \
		cp $(WHISPERCPP_DIR)/build/src/libwhisper*.so* $(PREFIX)/lib/ 2>/dev/null || true
	@echo "Installation complete"

#######################################
# Future repositories can be added here
# Example:
#
# LLAMA_DIR := llama.cpp
# LLAMA_REPO := https://github.com/ggerganov/llama.cpp.git
#
# .PHONY: setup-llama
# setup-llama:
# 	@if [ ! -d "$(LLAMA_DIR)" ]; then \
# 		git clone $(LLAMA_REPO); \
# 	fi
#######################################
