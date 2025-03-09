# MQTT Receiver  

This script connects to an MQTT broker, subscribes to a specified topic, and logs any incoming messages. It uses the **Paho MQTT** library for communication and supports configurable broker settings via command-line arguments.  

## What it does:  
- Connects to an MQTT broker (default: `broker.mqtt.cool`)  
- Subscribes to a topic (default: all topics `#`)  
- Logs incoming messages with timestamps  
- Handles connection and disconnection events  

You can send custom messages to the script by accessing: `https://testclient-cloud.mqtt.cool/`

## Usage:  
Run the script using:  
```bash
python mqtt_receiver.py --host <broker_host> --port <port> --topic <topic>
```  

### Example:  
```bash
python mqtt_receiver.py --host test.mosquitto.org --port 1883 --topic home/temperature
```  

If no arguments are provided, it uses default values. The script runs indefinitely until stopped.  
