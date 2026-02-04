# Spatial Asset Recommender

This is the documentation for the **Spatial Asset Recommender** Unreal plugin that recommends assets based on the current level viewport context.

## What is the Spatial Asset Recommender?

<video controls autoplay loop muted>
<source src="./media/Demo.mp4">
</video>

The _Spatial Asset Recommender_ provides a list of assets that share some similarity with the current level viewport context.
These assets have a high chance to fit into the current situation.

Instead of searching for the perfect asset in the Content Browser, _Spatial Asset Recommender_ might already serve it, ready to be placed in the level.

Save endless hours searching for assets that fit into your scenario.

## Quick Links

- [Purchase Spatial Asset Recommender]()

## How to Read this Documentation

This documentation is divided into three separate parts, plus and introduction.
The introduction will explain the terminology of this plugin and should be read by everyone using this plugin.

The user guide describes the artists' workflow for everyday work.
It explains the user interface of the main windows and how the plugin can be used.

The setup and admin guide explains how to set up the classifiers and how to run the commandlets.
It is recommended to set up an automated process to do that regularly.

The programmers' guide provides some hints about existing console variables and how to make custom extensions for your specific use cases.

## Table of Contents

- [Introduction](Introduction/index.md)
- User Guide
  - [Context Assets Window](Context-Assets/index.md)
  - [Classify Assets from the Content Browser](Classify-Assets-from-the-Content-Browser/index.md)
  - [View Tags for an Asset](View-Tags-for-an-Asset/index.md)
- Setup and Admin Guide
  - [Setup Classifiers](Setup-Classifiers/index.md)
  - [Run the Classify Commandlet](Run-the-Classify-Commandlet/index.md)
  - [Default Classifiers](Default-Classifiers/index.md)
  - [Demo LLM Server Setup](Demo-LLM-Server-Setup/index.md)
- Programmer's Guide
  - [Tune CVars](Tune-CVars/index.md)
  - [Write your own Classifier](Write-your-own-Classifier/index.md)