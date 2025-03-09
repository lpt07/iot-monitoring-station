# IoT Sensor Data Publisher

This script simulates IoT sensor devices and publishes random sensor data (temperature, humidity, and battery level) to an MQTT broker. It continuously generates random readings for predefined locations and stations and sends the data in JSON format.

## Features

- **Randomized Sensor Data:** The script generates random readings for temperature, humidity, and battery within predefined ranges.
- **MQTT Publishing:** Sends data to an MQTT broker at regular intervals (every 5 seconds).
- **Multiple Locations and Stations:** Supports multiple predefined locations and stations.
- **Configurable Broker Connection:** Allows specifying the broker's host and port.

## Predefined Locations and Measurements

The script simulates sensor data from three locations with the following configurations:

### **London (UK)**
- **Stations:** `iot-uk-01`, `iot-uk-02`
- **Temperature:** 15°C - 18°C
- **Humidity:** 30% - 40%
- **Battery:** 50% - 60%

### **New York (US)**
- **Stations:** `iot-us-01`, `iot-us-02`, `iot-us-03`
- **Temperature:** 20°C - 23°C
- **Humidity:** 45% - 50%
- **Battery:** 65% - 75%

### **Tokyo (JP)**
- **Stations:** `iot-jp-01`
- **Temperature:** 25°C - 30°C
- **Humidity:** 60% - 70%
- **Battery:** 80% - 100%

---

## Installation

```bash
pip install paho-mqtt
```

---

## Usage

You can run the script with the following command:

```bash
python iot_sensor.py --host <MQTT_BROKER_HOST> --port <MQTT_BROKER_PORT>
```

or use the `run-sensor.sh` script which automatically installs `paho-mqtt`:

```bash
./run-sensor.sh --host <MQTT_BROKER_HOST> --port <MQTT_BROKER_PORT>
```

### Example:
```bash
python iot_sensor.py --host test.mosquitto.org --port 1883
```

If no host or port is provided, the script will default to:
- **Host:** `localhost`
- **Port:** `1883`

---

## Output

The script will continuously generate output like this in the terminal:

```
2025-03-09 14:32:10 Publishing message: '{"temperature": {"timestamp": "2025-03-09 14:32:10", "value": 16.5}, "humidity": {"timestamp": "2025-03-09 14:32:10", "value": 35.4}, "battery": {"timestamp": "2025-03-09 14:32:10", "value": 55.1}}' to topic: London (UK)/iot-uk-01
```

The message structure looks like this:

```json
{
  "temperature": {
    "timestamp": "2025-03-09 14:32:10",
    "value": 16.5
  },
  "humidity": {
    "timestamp": "2025-03-09 14:32:10",
    "value": 35.4
  },
  "battery": {
    "timestamp": "2025-03-09 14:32:10",
    "value": 55.1
  }
}
```

---

## MQTT Topics

The script uses the following topic format:

```
<Location>/<Station>
```

Example topics:
- `London (UK)/iot-uk-01`
- `New York (US)/iot-us-03`
- `Tokyo (JP)/iot-jp-01`

---

## Customizing the Script

If you wish to modify the locations, stations, or measurement ranges, you can edit the `STATIONS` dictionary in the script:

```python
STATIONS = {
    "London (UK)": {
        "stations": ["iot-uk-01", "iot-uk-02"],
        "measurements": {
            "temperature": {
                "lower_bound": 15,
                "upper_bound": 18,
            },
            ...
        }
    },
    ...
}
```

---

## Stopping the Script

You can stop the script anytime using:

```bash
CTRL + C
```

