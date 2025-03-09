# Cowsay Docker Image (Using Ubuntu)

This repository contains a simple Docker image that runs the `cowsay` command inside a container. The container will output a message from a cow when executed. This version uses the **Ubuntu** base image.

## Dockerfile Explanation

The `Dockerfile` creates a custom Docker image with the following steps:

1. **Base Image**: It uses the official `ubuntu:latest` image, which is the official Ubuntu base image.
2. **Install cowsay**: It installs the `cowsay` package from Ubuntu’s default repositories.
3. **Update PATH**: It updates the `PATH` environment variable to ensure that `cowsay` can be executed without specifying the full path.
4. **Run cowsay**: The default command is set to run `cowsay` with the message: "Hello from the Docker world!"

## Steps to Build and Run the Docker Image

### 1. Build the Docker Image

Clone the repository or create a `Dockerfile` in your directory with the following contents:

```Dockerfile
# Use an official Ubuntu image as a base image
FROM ubuntu:latest

# Update the package list and install cowsay and other necessary utilities
RUN apt-get update && \
    apt-get install -y cowsay && \
    apt-get clean

# Update the PATH to include the directory where cowsay is located
ENV PATH="/usr/games:${PATH}"

# Set the default command to run cowsay with a custom message
CMD ["cowsay", "Hello from the Docker world!"]
```

Then, build the image with the following command:
```bash
docker build -t cowsay-image .
```

This will build the Docker image and tag it as `cowsay-image`.

### 2. Run the Docker Container

```bash
docker run cowsay-image
```

You should see the following output:

```bash
 ___________
< Hello from the Docker world! >
 -----------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

```