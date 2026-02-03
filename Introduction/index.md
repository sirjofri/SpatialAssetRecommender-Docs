[Start](../index.md) | [Next →](../Context-Assets/index.md)

# Introduction

Before diving into the details of the _Spatial Asset Recommender_, it is important to get on the same page about names and the basic functionality.
I try to keep this part short and easy to understand.

## Basic functionality

From a user's point of view, the core of the _Spatial Asset Recommender_ is a [Content Browser-like window](../Context-Assets/index.md) that updates automatically when the level viewport changes.
It tries to recommend assets that match the current viewport location in the level by looking at the assets that are already placed.

To find matching assets, it compares collections of _weighted tags_ that are assigned to each asset.

The other core part is about how to get these collections of weighted tags for each asset.
This process should be [as automated as possible](../Run-the-Classify-Commandlet/index.md) because nobody likes to manually tag gigantic lists of assets.
For that purpose, [_classifiers_](../Setup-Classifiers/index.md) have the job to do that based on their specialization.
While one classifier maybe takes the tags from a descriptive text of a Blueprint property, another classifier might take a look at the visual appearance in the thumbnail or actually listen to the audio of a sound file.

While the _Spatial Asset Recommender_ already provides a few classifiers, development teams can [write their own classifiers](../Write-your-own-Classifier/index.md) for their specific purposes.

## Terminology

- **Classifier**: A classifier is a custom class that can take a deeper look at assets to provide matching _weighted tags_. [A few default classifiers are provided](../Default-Classifiers/index.md).
- **Classification group**: To classify assets, they are grouped to allow for common classifier setups. The groups contain settings for metadata, supported asset types, and the classifier itself.
- **Asset**: An asset is everything that's listed in the Content Browser. This plugin makes no exception, but it differentiates between _classifiable_ assets and _non-classifiable_ assets. The difference is the definition: Classifiable assets are assigned to a _classification group_, which means they pass the path and class filters of a classification group.
- **Weighted Tag**: An asset can be described using a tag name and a weight value. Collections of weighted tags can be compared to derive a similarity score.

<!-- TODO: screenshot of a sample asset with its weighted tags. -->

[Next →](../Context-Assets/index.md)