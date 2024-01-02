---
title: Where can I find images to use?
keywords: get started, quick start, intro, concepts
description: Learn how to explore and run Docker Hub images
aliases:
- /get-started/run-docker-hub-images/
- /walkthroughs/run-hub-images/
---

{{< guide-products >}}

<iframe width="750" height="422" src="https://www.youtube.com/embed/nsWWQ1xoEy0?vq=hd1080&rel=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## Explanation

[Docker Hub](https://hub.docker.com/) has over 100,000 images created by 
developers that you can run locally. 


## Try it out!

{{< include "guides-get-docker.md" >}}

### Step 1: Search for the image

You can search for Docker Hub images on Docker Desktop. To search for the image used in this walkthrough:

1. Open Docker Desktop and select the search.
2. Specify `docker/welcome-to-docker` in the search.

![Search Docker Desktop for the welcome-to-docker image](images/getting-started-search.webp?w=650&border=true)

### Step 2: Run the image

To run the `docker/welcome-to-docker` image:

1. After finding the image using search, select **Run**.
2. Expand the **Optional settings**.
3. In **Host port**, specify `8090`.
   ![Specifying host port 8090](images/getting-started-run.webp?w=500&border=true)
4. Select **Run**.

> **Note**
>
> Many images hosted on Docker Hub have a description that highlights what
> settings must be set in order to run them. You can read the description for
> the image on Docker Hub by selecting the image name in the search or by
> searching for the image directly on
> [https://hub.docker.com](https://hub.docker.com).

### Step 3: Explore the container

That's it! The container is ready to use. Go to the **Containers** tab in Docker Desktop to view the container.

![Viewing the Containers tab in Docker Desktop](images/getting-started-view.webp?border=true)

## Recap and next steps

In this walkthrough, you searched for an image on Docker Hub and ran it as a container. Docker Hub has over 100,000 more images that you can use to help build your own application.

Continue to the next walkthrough to learn how you can use Docker to run
multi-container applications.

{{< button url="./multi-container-apps.md" text="Run multi-container apps" >}}


## Additional resources

Related information:

- Learn more about [Docker's Trusted Content](https://docs.docker.com/trusted-content/)
- Deep dive into the [Docker Hub manual](../../docker-hub/_index.md)
- Explore more images on [Docker Hub](https://hub.docker.com)

