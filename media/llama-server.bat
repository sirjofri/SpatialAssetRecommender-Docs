@echo off

llama-server.exe ^
 -hf ggml-org/gemma-3-12b-it-GGUF:Q4_K_M ^
 --port 8080 --host 127.0.0.1 ^
 --ctx-size 16000