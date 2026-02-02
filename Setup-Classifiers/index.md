[← Previous](../View-Tags-for-an-Asset/index.md) | [Start](../index.md) | [Next →](../Run-the-Classify-Commandlet/index.md)

# Setup Classifiers

The classifiers can be set up in the `Editor Preferences` &rarr; `Spatial Asset Recommender`.
The configuration will be saved in the `EditorPerProjectUserSettings.ini` file and can be handled like any other Unreal config file.

Inside these settings, you have _global_ settings and _per classification group_ settings.

## Global settings

![Global settings](./media/global-settings.png)

- `Asset Database`: This is the path to a JSON file that contains all the classification results for all classified assets. Its path is relative to your `Project.uproject` file.
- `Seed Tags`: Some classifiers can do a better job if they have a list of starting tags. This should be adjusted to your project needs. A basic default is set.
- `Ignore Tags`: Some classifiers can do a better job if they know which tags to ignore. For example, you can set overly generic tags like "Game" or "Prop."
- `Far Clip Distance`: For the context calculation, this is the farthest distance of assets that are considered "in context."
- `Near Clip Distance`: For the context calculation, this is the closest distance of assets that are considered "in context."

## Per classification group settings

![group-settings](./media/group-settings.png)

Each classification group has a unique name that's only used for you to distinguish them.
Other than that, each classification group has its own set of settings:

- `Asset Paths`: Array of paths that contain assets that should be affected by this group.
- `Asset Classes`: Array of object types that are affected by this group.
- `Metadata Properties`: Named object properties that should be considered as additional context for the classifier.
- `Classifier Class`: This classifier should be used for this group.
- `Classifier Settings`: This is an inline object that's automatically filled in depending on the selected _classifier class_. It provides additional classifier-specific settings.

---

These settings will be applied when using the [Content Browser classification routine](../Classify-Assets-from-the-Content-Browser/index.md), as well as the [commandlet](../Run-the-Classify-Commandlet/index.md).

[Next →](../Run-the-Classify-Commandlet/index.md)