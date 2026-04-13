[← Previous](../Run-the-Classify-Commandlet/index.md) | [Start](../index.md) | [Next →](../Demo-LLM-Server-Setup/index.md)

# Default Classifiers

## Name Classifier

This is a very simple classifier that only looks at asset names.
It can ignore prefixes, specified names, and uses word separators like `_` and _CamelCaseNotation_ to gather tag names.
It also ignores numbers, so that _Variation05_ will only be tagged as _Variation_.

- `Ignore Prefixes`: The classifier ignores asset prefixes such as `SM_`, `T_`, `SK_` and `M_`.
- `Ignore Names`: These words will be ignored even if they appear in the middle of an asset name.

## Chat Completions Classifier

The Chat Completions Classifier uses a Chat Completions API to classify assets.
It supports the asset name, the asset metadata and thumbnails.

The Classifier works in two passes:

1. Collect structured data for all assets. This structured data is then injected into the second pass.
2. Generate the tags for the assets.

### Prepass

During the prepass, the classifier asks the API about each asset individually.
The API is tasked to complete a structure of asset description based on its content, materials and the properties of that material.

In the end, the classifier will ask the API to "compress" the structure by removing or collapsing duplicate values.
This will shrink the data size, which reduces token usage in the classification pass and can lead to better results overall.

The gathered structured data is then used in the classification pass.

### Classification Pass

The classification pass is used to actually generate weighted tags for the individual assets.
The AI model is only allowed to pick tags from the structure collected during the prepass.
The classifier then connects the structured data to create weighted tags for the asset database.

### Settings

Each request will be a system prompt (text) and a user prompt (potentially multimodal).

- `API URL`: The url of the API, including the `v1`. Example: `http://localhost:8080/v1`.
- `API Key`: The authorization key, if needed.
- `Model`: The name of the model to use for this classifier. If your API supports different models, you can pick different models for each classification group.
- `Classification Temperature`: Temperature for the AI requests. This is usually a value between `0.0` and `2.0`. Values closer to `0.0` lead to more precise output, while higher values lead to more creative output.
- `System Prompt`: This is the system prompt for the requests. You can use `{seed_tags}` and `{ignore_tags}` to insert the global lists, as well as `{global_tags}` to insert all currently existing tags.
- `User Prompt`: This is the user prompt. You can use `{asset_name}` to insert the path and name of the asset. The metadata is currently automatically appended to the user prompt as "Key: Value" fields.
- `Prepass Model`: The name of the model to use for the prepass.
- `Prepass Temperature`: The temperature setting for the prepass.
- `Prepass System Prompt`: The system prompt for the prepass.
- `Prepass Optimize Prompt`: The optimize prompt for the prepass.
- `Asset Description Database Path`: The path to the structured output from the prepass.
- `Timeout`: Timeout for the connection. If your API server is pretty slow, you want to set a high value for this.
- `Request Delay`: Wait _n_ seconds between requests. This can be used to optimize the number of requests.
- `Num Retries`: After a classification fails (timeout or bad response), the classifier will retry _n_ times for the same asset before giving up.
- `Retry Delay`: Wait for _n_ seconds after a failed attempt. This can be useful if your request failed due to a server restart.

The Chat Completions classifier currently supports assets with thumbnails, but it can be extended to support audio, too.

Note that this classifier currently uses the _chat completions_ API only.

[Next →](../Demo-LLM-Server-Setup/index.md)