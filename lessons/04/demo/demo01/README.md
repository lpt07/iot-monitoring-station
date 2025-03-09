# Docker Compose for Eclipse Mosquitto

This Docker Compose setup runs an **Eclipse Mosquitto MQTT broker**.

## Files
- **docker compose.yml** - Defines the Mosquitto service.
- **mosquitto.conf** - Configuration file for Mosquitto.

## How to Run
Start the container:  
```shell
docker compose up
```

or in detached mode (without blocking your terminal):
```shell
docker compose up -d
```

Verify it's running:
```shell
# List of all the active containers
docker ps
```

Stop the container:
```shell
docker compose down
```
