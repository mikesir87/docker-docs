---
title: Injecting secrets during the build
keywords: concepts, build, images, docker desktop
description: Injecting secrets during the build
---

Secrets are sensitive pieces of information like passwords, API keys, or database credentials that your application needs during the build process, but shouldn't be stored within the final image. Injecting these secrets securely ensures both functionality and security for your app

Build secrets like passwords shouldn't be in your Docker image! While build arguments and environment variables are easy, they expose secrets. Instead, use secret mounts or SSH mounts for secure access during the build, ensuring your final image stays safe and sound. Remember, security first!

BuildKit provides a secure way to inject secrets during the build process. Here's how you can adapt the tutorial you provided to use BuildKit for secret injection:

**Modify Dockerfile and Build Command:**

Assuming you're using encrypted files for secrets, update your Dockerfile and build command as follows:

```console
# syntax = docker/dockerfile:1.2

FROM node:20-alpine

WORKDIR /app

EXPOSE 3000

# Mount secret files during build
RUN --mount=type=secret,id=MYSQL_CREDS \
    npm install

RUN --mount=type=secret,id=MYSQL_CREDS \
    node build.js

CMD ["node", "./src/index.js"]
```


Run the following command to set the Buildkit environment variable.

```console
 export DOCKER_BUILDKIT=1
```

Specify secrets ID and their encrypted file locations:

```console
 docker build \
    --secret id=MYSQL_CREDS,src=/path/to/encrypted_mysql_creds \
    -t your_todo_list_app .
```

Replace placeholders with your actual information:



* MYSQL_CREDS: Replace this with the actual ID you choose for your secret.
* `/path/to/encrypted_mysql_creds`: Replace this with the location of your encrypted MySQL credentials file.
* `/path/to/other_secrets`: Add similar lines for any other secrets you need during the build, each with a unique ID and file location

This approach allows you to securely inject secrets into your Node.js app's build process using BuildKit without compromising the security of your sensitive information.

{{< button text="Troubleshooting Failing Builds" url="troubleshooting-failing-builds" >}}
