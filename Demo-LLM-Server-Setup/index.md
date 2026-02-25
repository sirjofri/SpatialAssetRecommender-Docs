[← Previous](../Run-the-Classify-Commandlet/index.md) | [Start](../index.md) | [Next →](../Tune-CVars/index.md)

# Demo LLM Server Setup

One of the powerful features of the Spatial Asset Recommender is the ability to ask a large language model (LLM) for weighted tags.
To try out this feature, you need to set up a LLM server that supports chat completions.

> **Note:** Following this procedure, you'll have a _local_ LLM server. Depending on your hardware, you can only run smaller models. For production use, you want a powerful machine with lots of VRAM. If you have a machine like that, you can use a similar process to run larger models there.

> **Note:** This guide is meant for Windows users. Linux and Mac users will need to find their own way, though the process likely looks similar.

## Step 1: Get llama.cpp

There are mainly two easy ways to get llama.cpp:

1. Using winget (Vulkan only)
2. Downloading it from GitHub (Vulkan and CUDA)

> **Note:** I have nothing to do with llama.cpp or the creator of llama.cpp. Downloading and running their software is at your own risk!

### The winget way

1. Open a command line, e.g. by pressing `Win`+`R` and executing `cmd`.
2. Run the command `winget install ggml.llamacpp`.
3. If your system asks for administrator permissions, allow it. We're installing software!

### The GitHub way

1. Head over to [github.com/ggml-org/llama.cpp/releases](https://github.com/ggml-org/llama.cpp/releases) (external link).
2. Pick one of the versions to download the zip file.
3. Extract the zip file to a folder of your choice.
4. **Make sure that the binaries are added to your `%PATH%` environment variable.**
5. (If you chose a CUDA version: Download the _corresponding_ CUDA DLLs and extract them to the same folder.)

> **Note:** The CUDA version only works with an NVIDIA card.

## Step 2: Get the batch file

There are three ways to get the batch file I prepared:

1. Download it [here]().
2. Use the file from the repo (`llama-server.bat`).
3. Copy-paste the content and save the file as a `*.bat`.

```bat
@echo off
llama-server.exe ^
 -hf ggml-org/gemma-3-12b-it-GGUF:Q4_K_M ^
 --port 8080 --host 127.0.0.1
```

## Step 3: Run the server

Running the server is as simple as executing the batch file.
Windows will probably ask for firewall access on the first run.
Other than that, there are a few things to note:

- The provided batch file should work _as is_, and also quite stable. However, it's not fine-tuned to match the performance of your computer. See the next section for a few hints.
- The provided batch file will start the server as listening only for itself. If you want to run the server on a separate machine, you need replace the host address `127.0.0.1` with a different address, e.g. `0.0.0.0`.

> **Warning:** Exposing your server at `0.0.0.0` makes it reachable to anyone on your network. Be sure to only run this on a secure network and at your own risk!

## Step 4: Fine-tuning! (optional)

There are a few ways to improve the performance and accuracy of the LLM server:

- **Pick a different model.** While larger models are often more accurate, they need way more computing power. If you want fast response times, pick a model that fits into the VRAM of your GPU.
- **Adjust `--n-gpu-layers`.** This parameter sets the number of LLM model layers that will be offloaded into the GPU. You can use this to maximize the performance, but you'll need to try out different values.
- **Adjust `--threads`.** This is the number of CPU threads that will be used. It's often good to set it at the number of _physical_ CPU cores, sometimes it's better to reduce that number by 1. In some scenarios, it's even better to use a completely different value.
- **Do you _need_ multimodal support?** If you only want to classify assets with text-based values, you can save a bit of memory/VRAM usage by adding the `--no-mmproj` flag.
- **Adjust the context size.** In some cases, you can save performance by adjusting the `--ctx-size` parameter to a lower value.

These are a few of many parameters you can adjust, and it's a matter of playing around with them to find the sweet spot. There are external tools that can run benchmarks on your computer to find the best values, if you need them.

[Next →](../Tune-CVars/index.md)