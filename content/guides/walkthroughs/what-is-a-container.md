---
title: What is a container?
keywords: get started, quick start, intro, concepts
description: Learn what a container is by seeing and inspecting a running container.
aliases:
- /get-started/what-is-a-container/
---

<iframe width="750" height="422" src="https://www.youtube.com/embed/nsWWQ1xoEy0?vq=hd1080&rel=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Explanation

Simply put, a container is an isolated process on your machine. It has no knowledge
of the operating system and doesn't share any of the files installed directly on 
your machine, as it uses only the files from the container image. This means a 
containerized application will run the same everywhere!

With containers, you can run anything - a web app, a database, a game server, or
anything else you can think of!

## Try it out!

Let's run your first container and learn some basics about it!

{{< include "guides-get-docker.md" >}}

<p></p>

{{< tabs >}}
{{< tab name="Docker Desktop GUI" >}}

### Step 1: Start a container

Use the following instructions to run your first container.

1. Open Docker Desktop and open the search menu at the top of the window.
2. Specify `docker/welcome-to-docker` in the search and then select **Run**.
3. Expand the **Optional settings**.
4. In **Container name**, specify `welcome-to-docker`.
5. In **Host port**, specify `8088`. This is needed because, since this application is a web app, we need to allow network connections into the isolated environment.
   ![Specifying host port 8088](images/getting-started-setup.webp?w=500&border=true)
6. Select **Run**.

You just ran a container! Congratulations! 🎉

### Step 2: View your containers in Docker Desktop

The **Containers** tab in the Docker Desktop GUI gives you a quick overview of the
containers you've created. 

This container runs a simple web server that displays a simple website.
When working with more complex projects, you'll run different parts in different
containers. For example, a different container for the frontend, backend, and
database.

### Step 3: View the application

The frontend is accessible on port 8088 of your local host. Select the link in
the **Port(s)** column of your container or visit
[http://localhost:8088](http://localhost:8088) in your browser to view it.

![Accessing container frontend from Docker Desktop](images/getting-started-frontend.webp?border=true)

### Step 4: Explore your container

Docker Desktop lets you easily view and interact with different aspects of your
container. Try it out yourself. Select your container and then select **Files**
to explore your container's isolated file system.

![Viewing container details in Docker Desktop](images/getting-started-explore-container.webp?border=true)

### Step 5: Stop your container

The `welcome-to-docker` container continues to run until you stop it. To stop
the container in Docker Desktop, go to the **Containers** tab and select the
**Stop** icon in the **Actions** column of your container.

![Stopping a container in Docker Desktop](images/getting-started-stop.webp?border=true)

{{< /tab >}}
{{< tab name="Docker CLI" >}}


### Step 1: Start a container

To run a container, we will use the `docker run` command. In this command, we are
going to start a container using the `docker/welcome-to-docker` image and provide
a few additional options.

1. Open a terminal and start a container by running the following command:

    ```shell
    docker run -d -p 8088:80 --name welcome-to-docker docker/welcome-to-docker
    ```

    The flags are doing the following:

    - `-d` - run in "detached mode", meaning to start the container in the background
    - `-p 8088:80` - expose a port by connecting port 8088 on the host machine to the
       container's port 80 (more on that shortly)
    - `--name welcome-to-docker` - give the container a specific name. Otherwise, a 
      random name will be used
    - `docker/welcome-to-docker` - the image to use for the new container

    You'll see the image download and, after a moment, the new container will start!

    The random-looking output you see is the full ID of the container.

You just ran a container! Congratulations! 🎉

### Step 2: View your containers

To view running containers, use the `docker ps` command.

1. In your CLI, run the following command:

    ```shell
    docker ps
    ```

    You should see output like the following:

    ```console
    CONTAINER ID   IMAGE                      COMMAND                  CREATED         STATUS         PORTS                    NAMES
    1c56dc1c3569   docker/welcome-to-docker   "/docker-entrypoint.…"   14 seconds ago   Up 13 seconds   0.0.0.0:8088->80/tcp     welcome-to-docker
    ```

This container runs a simple web server that displays a simple website.
When working with more complex projects, you'll run different parts in different
containers. For example, a different container for the frontend, backend, and
database.

### Step 3: View the application

Remember that containers are isolated processes, which includes several networking
mechanisms. When we launched our container, we included a flag to "expose" a port,
which simply means to connect a host port to the container.

Since we used `-p 8088:80`, we mapped port 8088 of our local host to the container's
port 80. Therefore, we can open visit
[http://localhost:8088](http://localhost:8088) in a browser to view the app.

>**Pro-tip**
>
> Only expose ports that need to be accessed by non-containerized processes (such as a browser).
> Container-to-container communication can be done without exposing the ports, allowing
> your databases, caches, etc. to work without exposing them.
> Check out [Connecting multiple containers](./multi-container-apps) for more!
{ .info }


### Step 4: Explore your container

To learn more about your container, try the following commands:

1. Use `docker inspect` using the container's name to learn more about the running container:

    ```shell
    docker inspect welcome-to-docker
    ```

1. Use `docker inspect` using the container's ID to also learn more (obtain the 
   ID from `docker ps`):

    ```shell
    docker inspect 1c56dc1c3569
    ```

    >**Pro-tip**
    >
    > When using IDs in the CLI, you don't need the _entire_ ID, as long as what you
    > provide can be used to uniquely identify the container. For example, the previous
    > command could be completed using: `docker inspect 1c5`
    { .info }

1. Start a new shell to navigate the container by using the `docker exec` command:

    ```shell
    docker exec -ti 1c56dc1c3569 sh
    ```

    With this new shell, you can navigate through the container's filesystem, run commands
    found in the container, and more. For example, to view the web page:

    ```shell
    cat /usr/share/nginx/html/index.html
    ```

    When you're done, simply run `exit` to close out the shell

### Step 5: Stop your container

The `welcome-to-docker` container continues to run until you stop it.

1. In your terminal, stop the container by running the following command:

    ```shell
    docker stop welcome-to-docker
    ```

    Now, the container is stopped!

1. If we run `docker ps`, we will no longer see the container. However, it
   is still there. Run the following command to see all containers, including
   stopped containers:

   ```shell
   docker ps -a
   ```

   You'll then see output indicating the container has exited:

    ```console
    CONTAINER ID   IMAGE                      COMMAND                  CREATED          STATUS                      PORTS                    NAMES
    1c56dc1c3569   docker/welcome-to-docker   "/docker-entrypoint.…"   12 minutes ago   Exited (0) 11 seconds ago                            welcome-to-docker
    ```

1. To remove the stopped container, we can use the `docker rm` command:

    ```shell
    docker rm welcome-to-docker
    ```

    >**Pro-tip**
    >
    > If you provide the `--rm` flag when starting a container, it will be removed
    > automatically when it stops.
    >
    > Additionally, while you can only remove stopped containers, if you add the 
    > `-f` flag, it'll stop the container if needed and then remove it.
    > For example, running `docker rm -f welcome-to-docker` would have stopped and
    > then removed the container.
    { .info }

{{< /tab >}}
{{< /tabs >}}

## Recap and next steps

In this walkthrough, you ran a container using a pre-made image. In addition to running pre-made images, you can build and run your own application as a container. Or, learn how
to run multiple containers that need to communicate with each other

- [What is an image?](./what-is-an-image)
- [Connecting multiple containers](./multi-container-apps)

## Additional resources

If you'd like to dive in deeper to better understand containers, check out the following resources:

- Learn more about the `docker run` command in the [reference guide](https://docs.docker.com/engine/reference/run/) or the [command-line reference](https://docs.docker.com/engine/reference/commandline/run/)
- Read more about containers in [Use containers to Build, Share and Run your applications](https://www.docker.com/resources/what-container/)
- Deep dive in Liz Rice's [Containers from Scratch](https://www.youtube.com/watch?v=8fi7uSYlOdc) video presentation