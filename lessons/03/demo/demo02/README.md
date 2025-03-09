# Running Nginx with Docker

This guide explains how to run an Nginx web server in a Docker container. Docker allows you to easily deploy and manage applications in isolated environments, and Nginx is a popular web server that can serve static content and act as a reverse proxy.

## Steps to Run Nginx in Docker

To run an Nginx web server in a Docker container, use the following command:

```bash
docker run -d -p 8080:80 nginx
```

### Explanation of Parameters:

- **`docker run`**: This is the basic command used to create and start a container from a Docker image. In this case, it starts the Nginx image.

- **`-d`** (Detached Mode): This flag runs the container in the background and allows the terminal to be used for other tasks. Without `-d`, the command would run the container in the foreground, blocking your terminal.

- **`-p 8080:80`** (Port Mapping): This flag maps port `80` inside the container (where Nginx is running) to port `8080` on your host machine. This means that you can access the Nginx web server by visiting `http://localhost:8080` on your web browser.

- **`nginx`**: This is the Docker image that contains the Nginx web server. Docker will pull it from Docker Hub (if it's not already available locally) and use it to create a container running Nginx.

