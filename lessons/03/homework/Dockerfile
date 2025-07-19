# ToDo 1: Use the official Mosquitto image from Docker Hub
FROM eclipse-mosquitto:2.0

# ToDo 2: Expose the default MQTT port (1883)
EXPOSE 1883

# ToDo 3: Copy the Mosquitto configuration file into the container
COPY mosquitto.conf /mosquitto/config/mosquitto.conf

# Command to start Mosquitto
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
