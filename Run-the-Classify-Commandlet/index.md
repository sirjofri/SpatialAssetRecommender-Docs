[← Previous](../Setup-Classifiers/index.md) | [Start](../index.md) | [Next →](../Default-Classifiers/index.md)

# Run the Classify Commandlet

The commandlet is the class `SpatialAssetRecommender.ClassifyAssetsCommandlet` and it can be executed like any other commandlet:

```
/Path/To/UnrealEditor-Win64-DebugGame-Cmd.exe /Path/To/Project.uproject -run=SpatialAssetRecommender.ClassifyAssetsCommandlet
```

You probably want to provide more parameters:

- `-MaxAssets=N`: Will stop after `N` assets have been classified successfully.
- `-MaxMinutes=N`: Will stop after `N` minutes of total classification time.
- `-Iterate`: Will skip assets that have already been classified. Ignores hashes.
- `-Clear`: Ignore the existing database. This will overwrite any existing classified data.

The commandlet uses the [existing classifier configuration](../Setup-Classifiers/index.md).

> **Note:** Depending on the classifier configuration, the process can take a long time.
> You probably want to automate this process for your project.

[Next →](../Default-Classifiers/index.md)