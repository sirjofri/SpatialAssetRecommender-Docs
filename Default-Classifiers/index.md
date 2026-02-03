[← Previous](../Run-the-Classify-Commandlet/index.md) | [Start](../index.md) | [Next →](../Demo-LLM-Server-Setup/index.md)

# Default Classifiers

## Name Classifier

This is a very simple classifier that only looks at asset names.
It can ignore prefixes, specified names, and uses word separators like `_` and _CamelCaseNotation_ to gather tag names.
It also ignores numbers, so that _Variation05_ will only be tagged as _Variation_.

- `Ignore Prefixes`: The classifier ignores asset prefixes such as `SM_`, `T_`, `SK_` and `M_`.
- `Ignore Names`: These words will be ignored even if they appear in the middle of an asset name.

## Open API Classifier

The Open API Classifier uses an OpenAI API to classify assets.
It supports the asset name, the _seed tags_ and _ignore tags_ global lists, the asset metadata and thumbnails.

Each request will be a system prompt (text) and a user prompt (potentially multimodal).

- `API URL`: The url of the API, including the `v1`. Example: `http://localhost:8080/v1`.
- `API Key`: The authorization key, if needed.
- `Model`: The name of the model to use for this classifier. If your API supports different models, you can pick different models for each classification group.
- `System Prompt`: This is the system prompt for the requests. You can use `{seed_tags}` and `{ignore_tags}` to insert the global lists, as well as `{global_tags}` to insert all currently existing tags.
- `User Prompt`: This is the user prompt. You can use `{asset_name}` to insert the path and name of the asset. The metadata is currently automatically appended to the user prompt as "Key: Value" fields.
- `Timeout`: Timeout for the connection. If your API server is pretty slow, you want to set a high value for this.
- `Request Delay`: Wait _n_ seconds between requests. This can be used to optimize the number of requests.
- `Num Retries`: After a classification fails (timeout or bad response), the classifier will retry _n_ times for the same asset before giving up.
- `Retry Delay`: Wait for _n_ seconds after a failed attempt. This can be useful if your request failed due to a server restart.

The Open API classifier currently supports assets with thumbnails, but it can be extended to support audio, too.

Note that this classifier currently uses the _chat completions_ API only.

[Next →](../Demo-LLM-Server-Setup/index.md)