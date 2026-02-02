[← Previous](../Tune-CVars/index.md) | [Start](../index.md)

# Write your own Classifier

Implementing your own classifier is as easy as creating a new `UObject` type class that implements the `ISpatialAssetClassifier` interface:

```c++
/**
 * Initialize the classifier object. The settings object is of the type GetSettingsClass()
 */
virtual void InitClassifier(UObject* InSettings) {};

/**
 * Prepare the classification for the given asset.
 * @return true if the asset needs to be classified, false if it can be skipped (considered up to date).
 */
virtual void PrepareClassification(FAssetData AssetData, ISpatialTagsProvider* SpatialTagsProvider, FString& Hash) = 0;

/**
 * Classify the asset
 * @return true if the asset was classified successfully.
 */
virtual bool ClassifyAsset(FAssetData AssetData, TArray<FWeightedTag>& OutTags) = 0;

/**
 * Get the settings class for this classifier.
 */
virtual UClass* GetSettingsClass() const { return nullptr; };

/**
 * Get metadata as string for the given asset.
 */
virtual TMap<FString,FString> GetMetadata(UObject* Object);

/**
 * Get the normalized weighted tags for the given tags.
 */
static TArray<FWeightedTag> GetNormalizedWeightedTags(TArray<FWeightedTag>& InTags);

/**
 * Print final statistics
 */
virtual void PrintStatistics() {};

/**
 * For more expensive classifications, it might be worth saving every asset.
 */
virtual bool SaveEveryAsset() { return false; };
```

You can also take a look at the provided default classifiers.

## Use your custom classifier

The implemented classifier can then be picked in the [configuration](../Setup-Classifiers/index.md).

[Back to Start](../index.md)