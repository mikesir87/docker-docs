---
title: What is an image?
keywords: get started, quick start, intro, concepts
description: Learn what an image is by seeing and inspecting a running container.
aliases:
- /get-started/what-is-a-container/
---

<iframe width="750" height="422" src="https://www.youtube.com/embed/nsWWQ1xoEy0?vq=hd1080&rel=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Remember how a container is an isolated environment? An image is what provides the
files and default configuration for that environment. Think of it as a standardized
package that contains all of the files, binaries, and configuration needed to run
the application.

Images are composed of layers of filesystem changes, making it possible to build your
own image on top of another image (often referred to as a base image). Images, once
built, are immutable - you either create new layers or an entirely new image. More on
that soon!

## Try it out!

Let's pull a few images and try running a few containers using those images.

{{< include "guides-get-docker.md" >}}

### Step 1: Pull an image

Use the following instructions to pull an image.

1. Open Docker Desktop and open the search menu at the top of the window.
2. Specify `nginx` in the search and then select **Pull**.
3. Search for `redis` and **Pull** the image.
4. Finally, search for `mongo` and **Pull** the image.

Once they've all downloaded, you will have three separate images that contain everything
needed to run Nginx, Redis, and MongoDB.

### Step 2: View your images

The Docker Desktop dashboard makes it very easy to see the images you've downloaded.

1. Go to the **Images** tag in the Docker Desktop dashboard.
2. You should see the three images you just downloaded.


### Step 3: Start a container using the nginx image

Remember that images are simply the packaging for the environment for a container.
Let's start a container using the newly downloaded `nginx` container.

1. In the **Images** tab, locate the `nginx` image.
2. Click on the **Play** icon to run a new container.
3. Expand the **Optional settings**.
4. In **Host port**, specify `0` to allow a random port to be used. This configuration is needed because, since this application is a web app, we need to allow network connections into the isolated environment.
   ![Specifying host port 8088](images/getting-started-setup.webp?w=500&border=true)
5. Select **Run**.
6. Click on the port mapping link to open the app in your browser.

Congratulations! You've run a container using the `nginx` image! 🎉

### Step 3: Start a container using the redis image

1. In the **Images** tab, locate the `redis` image.
2. Click on the **Play** icon to run a new container.
3. For Redis, we're simply going to use the default configuration, so select **Run**.

Since we can't open Redis in the browser, we can interact with the running instance
using the terminal built into Docker Desktop.

1. Go to the **Exec** tab for the running redis container
2. Run `redis-cli`. You'll see a new prompt appear.
3. Run `SET test 1` to create a new data record in redis with the key of `test` and a value of `1`
4. Run `GET test` to get the stored value.

In future segments, we'll talk about how your applications can communicate with
redis over a networked connection.


### Step 4: Start a container using the mongo image

1. In the **Images** tab, locate the `mongo` image.
2. Click on the **Play** icon to run a new container.
3. For this container, we're simply going to use the default configuration, so select **Run**.

Since we can't open Mongo in the browser, we can interact with the running instance
using the terminal built into Docker Desktop.

1. Go to the **Exec** tab for the running redis container
2. Run `mongosh`. You'll see a new prompt appear.
3. Run `db.test.insertOne({ active: true, email: "moby@docker.com" });` to create a new data record in mongo.
4. Run `db.test.findOne({ email: "moby@docker.com" })` to get the stored value.

In future segments, we'll talk about how your applications can communicate with
mongo over a networked connection.

### Step 5: Removing images

As we saw, images package everything needed to run an application - you don't
have to think about how to install or configure the software! As such, they can
take up quite a bit of space. So, it's a good idea to remove images you're not
using.

1. Go to the **Images** tab in the Docker Desktop dashboard
2. Find the **nginx** image and click on the **Delete** icon. You'll get an error
   because you have a container currently using that image.
3. Click on the **In use** link for the **nginx** image to find all of the
   containers using the image. 
4. Delete the containers.
5. Go back to the **Images** tab and remove the **nginx** image.

That's it! Feel free to delete the other images if you'd like.

## Recap and next steps

In this walkthrough, you downloaded a few different images and started containers
with them.

- Where can I find images to use?
- How can I build my own image?
- How can I publish (or share) my own image?

{{< button url="./where-can-i-find-images-to-use.md" text="Where can I find images to use?" >}}

## Additional resources

If you'd like to dive in deeper to better understand containers, check out the following resources:

MORE TO COME HERE

- Read more about containers in [Use containers to Build, Share and Run your applications](https://www.docker.com/resources/what-container/)
- Deep dive in Liz Rice's [Containers from Scratch](https://www.youtube.com/watch?v=8fi7uSYlOdc) video presentation