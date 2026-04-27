@echo off

llama-server.exe ^
 -hf unsloth/gemma-4-E4B-it-GGUF:Q5_K_M ^
 --port 8080 --host 127.0.0.1 ^
 --ctx-size 16000