# Finalizing the Project: Integrating Grafana and Sending IoT Sensor Data

In this task, we will finalize the project by integrating Grafana into the docker-compose.yaml file. This involves setting up the Grafana container, configuring it to connect to InfluxDB, and creating a dashboard to visualize the IoT sensor data.

## 1. Adding the Grafana Container

To enable data visualization, we need to integrate Grafana into our docker-compose setup. Grafana will pull data from InfluxDB and display it in a user-friendly interface.

Use the following snippet to add the Grafana service to your docker-compose.yaml. Fill in the missing details (marked with `TODO`):

```Dockerfile
  grafana:
    # TODO 1: Specify the Docker image for Grafana.
    image: 
    
    # TODO 2: Reference the environment file that contains Grafana's environment variables.
    env_file: 
    
    # TODO 3: Map the Grafana port to the localhost port for browser access.
    ports: 
    
    # TODO 4: Persist Grafana's data and configuration using volumes.
    volumes: 
    
    # TODO 5: Ensure Grafana starts only after its dependencies are ready.
    depends_on: 
```

## 2. Grafana Datasource & Dashboard Setup

Once the Grafana container is added, the next step is to configure the datasource and create a dashboard for monitoring IoT sensor data.

### Manual Setup:

1. Open Grafana in your browser at `http://localhost:3000`.
2. Log in using the configured admin credentials.
3. Add an InfluxDB datasource pointing to `http://influxdb:8086`.
4. Create a dashboard and add panels to visualize data from the `iot_monitoring_station` database.

### Automated Setup (Using Provisioning):

- Grafana supports automatic provisioning through configuration files. The `grafana/provisioning` directory in the demo already includes the necessary setup.
- Ensure that the YAML files defining datasources and dashboards are correctly configured. These will be applied automatically when Grafana starts.

## 3. Starting the Docker Containers

After updating the docker-compose.yaml file with Grafana and configuring the necessary files, start the containers:

```bash
  docker compose up -d
```

This command launches all services in detached mode. Once running, you can access the services as follows:

- Grafana: `http://localhost:3000`

## 4. Sending IoT Sensor Data

With the containers running, mock IoT sensor data can be sent to the `MQTT Broker`. This data is later processed and visualized in Grafana.

Navigate to the IoT directory:

```bash
  cd lessons/05/homework/iot
```

Run the script responsible for generating and sending IoT sensor data:

```bash
  ./run-sensor.sh
```

The script continuously transmits sensor readings to the `MQTT Broker`. The `Backend` service subscribes to the broker and stores received messages in `InfluxDB`. You can verify this by checking the Grafana dashboard, where real-time visualizations should appear as data flows into the database.

## 5. Cleaning Up

Once testing and visualization are complete, stop the Docker containers and clean up the environment.

To stop the `sensor.py` script and shut down all Docker services:

```bash
  docker compose down
```

## Summary

In this task, you:

- Integrated Grafana into the Docker Compose setup.
- Configured Grafana to visualize data stored in InfluxDB.
- Monitored live data updates in Grafana.

By completing this setup, you've successfully created a Dockerized environment for real-time visualization of IoT sensor data!
