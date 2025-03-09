# Homework: IoT Sensor Data Pipeline with Docker Compose

The goal of this homework is to integrate the `backend`, `influxdb` database, and the `mosquitto broker` into a single `docker-compose.yaml` file. The `backend` will receive messages from IoT sensors through MQTT and will write them in `InfluxDB`.

## 📁 Project Structure

Your project should have the following structure:

```
project-root
│
├── backend
│   ├── .env
│   ├── Dockerfile
│   ├── backend.py
│   ├── .dockerignore
│   ├── requirements.txt
│
├── mosquitto
│   ├── mosquitto.conf
│
├── influxdb
│   ├── init-db.sh
│   ├── persistent
│       ├── influxdb
│
├── docker-compose.yaml
├── run.sh
├── clean.sh
```

### ✅ Description of Components

#### **1. Backend**
- **Purpose:** Contains the Python application (`backend.py`) responsible for receiving MQTT messages from the IoT sensor and writing the data to InfluxDB.
- **Files:**
  - `.env`: Contains the environment variables.
  - `Dockerfile`: Defines how the backend container is built.
  - `backend.py`: The main Python application for processing IoT data.
  - `.dockerignore`: Files to exclude from the Docker build context.
  - `requirements.txt`: Python dependencies.

#### **2. Mosquitto**
- **Purpose:** Acts as the MQTT broker that receives messages from the IoT sensor.
- **Files:**
  - `mosquitto.conf`: Configuration file for the broker.

Content of `mosquitto.conf`:
```bash
# Listen on MQTT default port (non-secure)
listener 1883

# Authentication settings (optional)
allow_anonymous true
```

#### **3. InfluxDB**
- **Purpose:** Time-series database for storing IoT sensor data.
- **Files:**
  - `init-db.sh`: Shell script to initialize the database.
  - `persistent/influxdb`: Directory for storing InfluxDB data.

Content of `init-db.sh`:
```bash
#!/bin/sh

influx -execute 'CREATE DATABASE "iot_monitoring_station" WITH DURATION INF'
```

## 🚀 Instructions

### Step 1: Setup the Directory Structure

Create the directories and copy the respective files as described in the project structure.

### Step 2: Complete `docker-compose.yaml`

The `docker-compose.yaml` will orchestrate the `backend`, `mosquitto`, and `influxdb`. Fill in the **8 TODOs** in `docker-compose.yaml` using the previous examples provided in the demo.

### Step 3: Configure Environment Variables

Edit `backend/.env` and fill in the **TODOs** for the environment variables:
```bash
MQTT_BROKER_HOST=...
MQTT_BROKER_PORT=...
INFLUXDB_HOST=...
INFLUXDB_PORT=...
INFLUXDB_DATABASE=...
```

### Step 4: Complete Backend Dockerfile

Modify `backend/Dockerfile` to forward the environment variables to `backend.py`. This will allow the application to connect to the MQTT broker and InfluxDB.

### Step 5: Implement Backend Code

Follow the **TODOs** in `backend/backend.py` to complete the code that:
- Listens to messages from the MQTT broker.
- Parses the message payload.
- Writes the data to InfluxDB.

Refer to previous demo files if needed.

### Step 6: Run the Containers

Once everything is implemented, start the Docker containers using the provided script:

```bash
source run.sh
```

or manually:
```bash
docker compose up -d
```

### Step 7: Run the IoT Sensor Script

To test the setup, run the IoT sensor script (`iot/sensor.py`) to publish data to the broker.

```bash
cd backend
./run-sensor.sh
```

Verify the logs in the `backend` container to ensure data is being written to InfluxDB:

```bash
docker logs -f backend
```

### Step 8: Verify Data in InfluxDB

Use the `lessons/05/demo/demo01/reader/reader.py` script to verify if the data has been published successfully to InfluxDB. Alternatively you can check if the `influxdb/persistent/influxdb` folder is growing in size (this is a sign that data is stored successfully in the database).


## 🧼 Cleaning Up

To stop and remove all containers, networks, and volumes, run:
```bash
source clean.sh
```
