# Running a Container with Alpine Linux in Docker

This guide explains how to run a container with the Alpine Linux image in Docker. Alpine is a minimal Docker image that is often used to create lightweight containers. In this example, we will run the Alpine container and start a shell inside it.

## Example:

To run an Alpine container and start a shell, use the following command:

```bash
docker run -it alpine /bin/sh
```

### Explanation of Parameters:

- **`docker run`**: This is the basic command used to create and start a container from a Docker image. In this case, it starts the Alpine image.

- **`-it`** (Interactive Mode):
  - **`-i`**: Stands for "interactive mode." It keeps the standard input (stdin) open, allowing you to interact with the container.
  - **`-t`**: Allocates a pseudo-TTY (terminal) for the container, enabling you to use a terminal interface inside the container. Together, `-it` allows you to interact with the container in real-time through the terminal.

- **`alpine`**: This is the name of the Docker image that contains Alpine Linux. Docker will pull the Alpine image from Docker Hub (if it's not already available locally) and use it to create the container.

- **`/bin/sh`**: This is the command to run inside the Alpine container. It starts the shell (`sh`) so you can interact with the container through the command line.
