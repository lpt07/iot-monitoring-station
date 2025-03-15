
# IoT Data Visualization with Grafana and InfluxDB

This demo project demonstrates how to set up an IoT data pipeline using **InfluxDB** to store sensor data and **Grafana** for visualizing that data. The project uses **Docker Compose** to spin up services for **InfluxDB** and **Grafana**, and also configures Grafana to automatically connect to InfluxDB and provision dashboards.

## 📁 Project Structure

```
project-root
│
├── influxdb
│   ├── init-db.sh
│   └── persistent/
│       └── influxdb/
│
├── grafana
│   ├── grafana.env
│   ├── provisioning/
│   │   ├── dashboards/
│   │   └── datasources/
│   └── persistent/
│
├── docker-compose.yaml
```

### ✅ Description of Components

#### **1. InfluxDB**
- **Purpose:** InfluxDB is a time-series database used to store sensor data.
- **Files:**
  - **`init-db.sh`**: A script that initializes the InfluxDB database with a default database (`iot_monitoring_station`) when the InfluxDB container starts.
  - **`persistent/influxdb/`**: A persistent volume where InfluxDB data is stored to ensure data survives container restarts.

**Content of `init-db.sh`:**
```bash
#!/bin/sh

influx -execute 'CREATE DATABASE "iot_monitoring_station" WITH DURATION INF'
```

#### **2. Grafana**
- **Purpose:** Grafana is used to visualize the sensor data stored in InfluxDB through dashboards.
- **Files:**
  - **`grafana.env`**: The environment file that contains configuration values for the Grafana container, such as the username/password.
  - **`provisioning/`**: This directory contains configuration files that allow Grafana to automatically set up data sources and dashboards.
  - **`persistent/`**: A directory for persisting Grafana’s data, including dashboards, user settings, and databases.

#### **3. Docker Compose**
- **Purpose:** The `docker-compose.yaml` file defines the services (InfluxDB and Grafana) that will be deployed using Docker Compose.
- **File:**
  - **`docker-compose.yaml`**: Defines the InfluxDB and Grafana services, their configurations, and how they depend on each other.

**Content of `docker-compose.yaml`:**
```yaml
services:
  influxdb:
    image: influxdb:1.8
    ports:
      - 8086:8086
    volumes:
      - ./influxdb/init-db.sh:/docker-entrypoint-initdb.d/init-db.sh
      - type: bind
        source: influxdb/persistent/influxdb
        target: /var/lib/influxdb
  
  grafana:
    image: grafana/grafana:latest
    env_file: grafana/grafana.env
    ports:
      - 3000:3000
    volumes:
      - type: bind
        source: ./grafana/persistent
        target: /var/lib/grafana
      - ./grafana/provisioning/:/etc/grafana/provisioning
    depends_on:
      - influxdb
```

## 🚀 Instructions

### Step 1: Setup the Directory Structure

Create the necessary directories as per the structure defined above and place the files accordingly. You can use the provided files as references.

### Step 2: Configure Grafana Environment Variables

Edit the **`grafana/grafana.env`** file and set the necessary environment variables to connect Grafana to the InfluxDB service. Example:

```bash
GF_SECURITY_ADMIN_USER=grafana
GF_SECURITY_ADMIN_PASSWORD=grafana
```

### Step 3: Set Up Provisioning for Grafana Dashboards

Place any Grafana dashboard files in the **`grafana/provisioning/dashboards/`** directory. These will be automatically loaded by Grafana when the container starts.

**Example file structure for `grafana/provisioning/`:**
```
grafana/provisioning/
│
└── dashboards/
    └── your-dashboard.json
```

You can create a custom `dashboards.yaml` file inside the **`grafana/provisioning/`** directory to point to your dashboards. Example `dashboards.yaml`:

```yaml
apiVersion: 1
providers:
  - name: 'default'
    orgId: 1
    folder: ''
    type: file
    disableDeletion: false
    updateIntervalSeconds: 10
    options:
      path: /etc/grafana/provisioning/dashboards
```

### Step 4: Build and Start the Containers

Once the configuration files are ready, use Docker Compose to build and start the containers:

```bash
docker-compose up -d
```

This will start both InfluxDB and Grafana. InfluxDB will automatically initialize the database and Grafana will start provisioning the data source and dashboards.

### Step 5: Access Grafana

- Open your browser and navigate to `http://localhost:3000` to access the Grafana UI.
- Log in using the username and the password you configured in **`grafana/grafana.env`**.

### Step 6: Create a Custom InfluxDB Datasource in Grafana

#### 1. **Login to Grafana**:

After logging in to Grafana, follow these steps to create a custom InfluxDB datasource:

- From the Grafana dashboard, click on the **gear icon** (⚙️) on the left sidebar to open **Configuration**.
- Click on **Data Sources** and then **Add Data Source**.

#### 2. **Configure InfluxDB Data Source**:

- **Name:** Enter a name for the datasource (e.g., "IoT InfluxDB").
- **Type:** Select **InfluxDB** from the list of available data sources.
- **URL:** Enter the URL of your InfluxDB service. Since you are running InfluxDB in Docker, use `http://influxdb:8086`.
- **Database:** Enter the name of the InfluxDB database (`iot_monitoring_station`).
- **User:** Enter the username (if configured).
- **Password:** Enter the password (if configured).

Click **Save & Test** to ensure the connection works.

### Step 7: Set Up a New Dashboard

#### 1. **Create a Dashboard**:

- From the Grafana home page, click on **"+"** on the left sidebar and select **Dashboard**.
- Click **Add New Panel**.

#### 2. **Add Panels with Queries**:

For each panel, you can add a query to display data from the InfluxDB database.

Here’s an example of a query for a temperature sensor data panel:

```sql
SELECT value
FROM "temperature"
GROUP BY "location", "station"
ORDER BY time DESC
```

- In the **Panel editor**:
  - Select the **InfluxDB** data source from the **Query section**.
  - Paste the query above into the query editor.
  - You should start seeing data visualized in the panel.

#### 3. **Customize the Panel**:

- You can customize the panel's visualization type (e.g., graph, table, gauge, etc.).
- Set the **Time range** for the panel (e.g., last 24 hours, last 7 days).

#### 4. **Save the Dashboard**:

- After adding all the necessary panels, click **Save** (disk icon) at the top of the page.
- Enter a name for the dashboard (e.g., "IoT Temperature Dashboard") and choose a folder for the dashboard (optional).


### Step 8: Send Data to InfluxDB and Monitor in Real-Time

To start populating your InfluxDB with data, run the **InfluxDB writer script** (`lessons/05/demo/demo01/writer/writer.py`). This script will simulate sending IoT sensor data to InfluxDB.

#### Running the Writer Script:
- Ensure that the InfluxDB container is up and running.
- Execute the writer script from the project directory:

```bash
cd lessons/05/demo/demo01/writer
./run-writer.sh
```

The script will begin sending data to your InfluxDB instance, which will be stored in the `iot_monitoring_station` database.

#### Monitor Data in Real-Time:
Once the data starts flowing into InfluxDB, head over to your **Grafana** dashboard.

- Open Grafana in your browser at `http://localhost:3000`.
- The panels you’ve configured will begin to display the sensor data in real-time, allowing you to visualize the changes as new data arrives.
  
As the data continues to be written to InfluxDB, Grafana will automatically update the dashboards, providing you with up-to-date visualizations.


## 🧼 Cleaning Up

To stop and remove all containers, networks, and volumes, run:

```bash
docker-compose down
```

This will remove the containers and any persistent data volumes used by the services.
