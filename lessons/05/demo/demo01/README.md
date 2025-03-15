
# InfluxDB

This project includes tools to run an InfluxDB instance, either ephemeral or persistent, along with scripts to read and write data to the InfluxDB database. The `reader.py` script reads data from the InfluxDB instance, and the `writer.py` script generates and writes random sensor data to the database.

## Project Structure

The project is structured as follows:

```
.
├── docker-compose-ephemeral.yaml       # Docker Compose file for ephemeral InfluxDB setup
├── docker-compose-persistent.yaml      # Docker Compose file for persistent InfluxDB setup
├── run-ephemeral.sh                    # Script to run the ephemeral InfluxDB setup
├── run-persistent.sh                   # Script to run the persistent InfluxDB setup
├── init-db.sh                          # Script to initialize the 'iot_monitoring_station' database
├── clean.sh                            # Script to clean up Docker containers and images
├── reader/                             # Directory containing the reader script and its execution file
│   ├── reader.py                       # Python script to read data from InfluxDB
│   └── run_reader.sh                   # Script to run the reader.py script
└── writer/                             # Directory containing the writer script and its execution file
    ├── writer.sh                       # Script to simulate writing sensor data to InfluxDB
    └── run_writer.sh                   # Script to run the writer.sh script
```

## Docker Compose Setup

There are two Docker Compose configurations provided:

### 1. Ephemeral InfluxDB (`docker-compose-ephemeral.yaml`)

This configuration sets up InfluxDB with non-persistent data storage. Any data stored in the database will be lost if the container is restarted or removed. This setup is useful for testing or short-term use cases.

To run the ephemeral InfluxDB setup, use the following command:

```bash
source run-ephemeral.sh
```

### 2. Persistent InfluxDB (`docker-compose-persistent.yaml`)

This configuration sets up InfluxDB with persistent data storage. The data is stored in a volume, which ensures that the data persists across container restarts and removals. This setup is ideal for long-term use and production environments.

To run the persistent InfluxDB setup, use the following command:

```bash
source run-persistent.sh
```

## Database Initialization

The `init-db.sh` script is used to initialize the InfluxDB database (`iot_monitoring_station`). It is automatically executed when the InfluxDB container starts, creating the required database.

## Data Reader (`reader.py`)

The `reader.py` script queries the InfluxDB instance for data, fetching the results from the last 5 minutes based on the timestamp. The script logs the number of results returned and shows the last 5 (or fewer) data points. The script can be run using:

```bash
cd reader
source run_reader.sh
```

## Data Writer (`writer.sh`)

The `writer.sh` script generates random sensor data (temperature, humidity, battery) and writes it to the InfluxDB database. The data is written with a random value within defined bounds. The script can be run using:

```bash
cd writer
source run_writer.sh
```

## NOTE

If you encounter permission errors for the InfluxDB container, you might need to offer read and write (rw) permissions for the persistent/influxdb folder.

```bash
# Recursively set read/write permissions on all files
sudo chmod -R a+rw persistent
```