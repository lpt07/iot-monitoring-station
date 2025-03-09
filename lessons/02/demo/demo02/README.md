# MQTT Sender

This script connects to an MQTT broker, publishes a message to a specified topic, and logs the process. It uses the **Paho MQTT** library for communication and supports configurable broker settings via command-line arguments.

## What it does:
- Connects to an MQTT broker (default: `broker.mqtt.cool`)
- Publishes a message to a specified topic
- Logs connection and disconnection events

You can check if messages are sent successfully by accessing: https://testclient-cloud.mqtt.cool/

## Usage:
Run the script using:
```bash
python mqtt_sender.py --host <broker_host> --port <port> --topic <topic> --message <message>
```

### Example:
```bash
python mqtt_sender.py --host test.mosquitto.org --port 1883 --topic home/temperature --message "25.6C"
```