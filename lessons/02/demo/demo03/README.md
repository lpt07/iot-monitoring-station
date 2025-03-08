### Usage:
To see the interaction between the **receiver** and **sender**, follow these steps:

1. **In one terminal**, run the **receiver** script to subscribe to a specific topic:
   ```bash
   python receiver.py --topic <topic>
   ```

2. **In another terminal**, run the **sender** script to publish a message to the same topic:
   ```bash
   python sender.py --topic <topic> --message <message>
   ```

### Example Usage:
For example, if you want to monitor the `iot-monitoring-station` topic, you would:

1. **In the first terminal**, run the **receiver**:
   ```bash
   python receiver.py --topic iot-monitoring-station
   ```

2. **In the second terminal**, run the **sender**:
   ```bash
   python sender.py --topic iot-monitoring-station --message "IoT Monitoring Station"
   ```

The receiver will log and display any messages it receives on the `iot-monitoring-station` topic, while the sender will publish the message `"IoT Monitoring Station"` to that topic.