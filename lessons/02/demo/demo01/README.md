# MQTT Receiver  

This script connects to an MQTT broker, subscribes to a specified topic, and logs any incoming messages. It uses the **Paho MQTT** library for communication and supports configurable broker settings via command-line arguments.  

## What it does:  
- Connects to an MQTT broker (default: `localhost`)  
- Subscribes to a topic (default: all topics `#`)  
- Logs incoming messages with timestamps  
- Handles connection and disconnection events  

If no arguments are provided, it uses default values. The script runs indefinitely until stopped.  

## Usage:  
Run the script using:  
```bash
# You need to install the paho-mqtt library before running the receiver
python receiver.py --host <broker_host> --port <port> --topic <topic>
```  

or use the provided shell script:
```bash
# This will automatically install the paho-mqtt library
./run-receiver.sh --host <broker_host> --port <port> --topic <topic> --message <message>
```

### Example:  
```bash
python receiver.py --host test.mosquitto.org --port 1883 --topic iot-monitoring-station
```  

You can send custom messages to the script by accessing: `https://testclient-cloud.mqtt.cool/`
