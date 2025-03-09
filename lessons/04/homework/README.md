# Lesson 03 - Homework

In this homework, you will set up a Docker Compose file containing three services:

- **Mosquitto broker**
- **Sender script** (implemented in Lesson 02)
- **Receiver script** (implemented in Lesson 02)

## Explanation

The goal is to containerize the sender and receiver scripts and connect them via a Mosquitto broker using Docker Compose.

## Step 1: Setup the Receiver

### Directory Structure

Create a `receiver/` directory with the following files:

- **Dockerfile**
- **requirements.txt**
- **receiver.py**

### Instructions

- You can copy-paste the `receiver.py` script from `lesson02`. However, a better approach is to create a hard-link to the script. Refer to [ln command manual](https://man7.org/linux/man-pages/man1/ln.1.html) for more information.
- The `requirements.txt` file should list all the required modules for the `receiver.py` script. The only required module is `paho-mqtt`.
- The `Dockerfile` should be based on the template provided below, filling in the `TODOs`.

### Dockerfile Template

```Dockerfile
# TODO 1: Use the official Python image from Docker Hub (python:3.9-slim)

# TODO 2: Set a working directory in the container (e.g., /app)

# TODO 3: Copy the requirements.txt into the container (in the working directory)

# TODO 4: Install the required Python dependencies from the requirements.txt

# TODO 5: Copy the receiver.py script into the container

# TODO 6: Run the receiver.py script. Remember you need to specify a host and a topic (hint: use the same name as the mosquitto service from docker-compose.yaml)
```

## Step 2: Setup the Sender

Follow the same instructions from **Step 1**, but create a `sender/` directory with:

- **Dockerfile**
- **requirements.txt**
- **sender.py**

The process is similar to setting up the receiver.

## Step 3: Create a `docker-compose.yaml`

The `docker-compose.yaml` file should define three services:

- **Mosquitto broker** - Reference lessons/04/demo/demo01
- **Receiver** - Build the image from `receiver/Dockerfile`
- **Sender** - Build the image from `sender/Dockerfile`

### Docker Compose Template

```yaml
services:
  mosquitto:
    # TODO 1: Add the mosquitto configuration

  receiver:
    # Build a custom image using receiver/Dockerfile
    build: ./receiver
    # Manage container dependencies
    depends_on:
      # Ensure the container does not start until the Mosquitto broker is initialized
      - mosquitto

  sender:
    # TODO 2: Add the sender configuration
```

## Step 4: Start the Containers

Run the following command to start all containers:

```bash
docker compose up -d
```

## Step 5: Verify Container Status

Check if the containers are running:

```bash
docker ps
```

Verify the logs of the sender/receiver:

```bash
# Find the container ID from the docker ps output
docker logs <containerID>
```

If you have Docker Desktop installed, you can use the UI to check container statuses and logs.

## Step 6: Stop and Clean Up

Stop and remove all containers and images:

```bash
docker compose down --rmi all
```

This will ensure that no residual images or containers remain after testing.

