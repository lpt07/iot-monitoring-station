# MQTT Sender

This script connects to an MQTT broker, publishes a message to a specified topic, and logs the process. It uses the **Paho MQTT** library for communication and supports configurable broker settings via command-line arguments.

## What it does:
- Connects to an MQTT broker (default: `localhost`)
- Publishes a message to a specified topic
- Logs connection and disconnection events

If no arguments are provided, it uses default values. The script runs indefinitely until stopped. 

## Usage:
Run the script using:
```bash
# You need to install the paho-mqtt library before running the sender
python sender.py --host <broker_host> --port <port> --topic <topic> --message <message>
```

or use the provided shell script:
```bash
# This will automatically install the paho-mqtt library
./run-sender.sh --host <broker_host> --port <port> --topic <topic> --message <message>
```

### Example:
```bash
python sender.py --host test.mosquitto.org --port 1883 --topic iot-monitoring-station --message "IoT Monitoring Station"
```

You can check if messages are sent successfully by accessing: https://testclient-cloud.mqtt.cool/