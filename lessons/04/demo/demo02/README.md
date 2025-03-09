
# Flask App Docker Compose Setup

This repository contains a `docker-compose.yaml` file that sets up a Flask application inside a Docker container. It utilizes a custom Docker image, which is built from a `Dockerfile` located within the `./flask-app` directory.

## Services

- **flask-app**: This service represents the Flask application. It builds the Docker image from the `Dockerfile` in the `./flask-app` directory and maps port 5000 on the host to port 5000 on the container. This allows you to access the Flask application via `http://localhost:5000` on your machine.

## File Structure

```
.
├── docker-compose.yaml
└── flask-app/
    └── Dockerfile
```

- **docker-compose.yaml**: The Docker Compose configuration file for defining the services.
- **flask-app/Dockerfile**: The Dockerfile that defines the custom image for the Flask application.


## Build and Run the Flask Application

### 1. Build the Docker Image

To build the custom Docker image for the Flask app, run the following command in the directory where the `docker-compose.yaml` file is located:

```bash
docker-compose build
```

This command will:

- Look for the `Dockerfile` inside the `./flask-app` directory.
- Build the custom image for the Flask app as defined in the `Dockerfile`.

### 2. Start the Flask App

Once the image is built, you can start the containerized Flask application with the following command:

```bash
docker-compose up
```

This command will:

- Create and start the Flask application container.
- Map port 5000 of your machine to port 5000 in the container, so you can access the app at `http://localhost:5000`.

### 3. Stopping the Application

To stop the running container, press `Ctrl+C` in the terminal where `docker-compose up` is running, or you can run:

```bash
docker-compose down
```

This will stop and remove all containers, networks, and volumes created by `docker-compose up`.

## Accessing the Flask App

Once the container is up and running, you can access the Flask app at `http://localhost:5000` in your web browser.
