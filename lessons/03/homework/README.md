# Lesson 03 - Homework

In this homework, you will set up a local Mosquitto MQTT broker using Docker and Dockerfiles. Additionally, you will modify the scripts from the previous session to connect to this local broker and exchange messages.

### Explaination

In this exercise, you will configure and run a Mosquitto MQTT broker within a Docker container, and update your existing MQTT client scripts to communicate with the local broker instead of a remote one.

## Step 1: Mosquitto configuration file

You will need to create a configuration file for the Mosquitto broker. This file (`mosquitto.conf`) contains settings such as which port Mosquitto should listen on, and whether authentication is required.

Paste the following configuration into the `mosquitto.conf` file:

```bash
# Listen on the default MQTT port (1883) for non-secure connections
listener 1883

# Allow anonymous connections (no authentication required)
allow_anonymous true
```

## Step 2: Create a Dockerfile

```Dockerfile
# ToDo 1: Use the official Mosquitto image from Docker Hub (eclipse-mosquitto)


# ToDo 2: Expose the default MQTT port (1883)


# ToDo 3: Copy the Mosquitto configuration file into the container
#         This ensures the container uses your custom configuration


# Command to start Mosquitto
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
```

## Step 3: Build the Docker image

```bash
# Build the Docker image using the Dockerfile
# Choose an appropriate name for the image (e.g., mosquitto-broker)
# ToDo:
docker build -t ...
```

## Step 4: Run the Docker container

```bash
# Run the Docker container from the image
# Don't forget to map the local port (1883) to the container's port (1883) to allow communication
# ToDo:
docker run ... 
```

## Step 5: Connect to local broker and send messages

Use the scripts from the previous lesson to send/receive messages using the local broker

```bash
# Run the receiver
# Don't forget to use the localhost instead of broker.mqtt.cool
# ToDo:
python receiver.py ...
```

```bash
# Run the sender
# Don't forget to use the localhost instead of broker.mqtt.cool
# ToDo:
python sender.py ...
```