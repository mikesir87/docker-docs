---
title: Overview - Docker for AI/ML workloads
keywords: get started, quick start, intro, concepts
description: Learn how to build a basic AI/ML application using Docker
---

<iframe width="750" height="422" src="https://www.youtube.com/embed/nsWWQ1xoEy0?vq=hd1080&rel=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

In this guide, you will create a simple AI/ML application from scratch, using
Docker along the way.

## Prerequisites

In order to complete this guide, you should have a basic understanding of the
following concepts. If you don't yet, take a few minutes to go through the
material.

- [What is a container?](../walkthroughs/what-is-a-container.md)
- [What is an image?](../walkthroughs/what-is-an-image.md)
- [Building your own images](../walkthroughs/where-can-i-find-images.md)
- [Connecting multiple containers](../walkthroughs/what-is-an-image.md)

## Overview

This guide is inspired by the [GenAI stack](https://github.com/docker/genai-stack), 
which is intended to be a great starting point. During this guide, we will
build an app from scratch, helping you learn about the various components
you might use in a GenAI application.

>**Note**
>
> There are _many_ ways to build a GenAI application. This example is intended
> to be exactly that... an example. Components should be swapped as you see
> see fit.
{ .info }


1. Build a simple LLM-supported chat bot
1. Augment the chat bot with custom data