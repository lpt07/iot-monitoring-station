
# InfluxDB Writer

The `writer.py` script is used to simulate writing sensor data (e.g., temperature, humidity, battery levels) to an InfluxDB instance. The script generates random sensor data within defined ranges and writes it to the specified InfluxDB database.

## Features

- Generates random sensor data (e.g., temperature, humidity, battery).
- Connects to an InfluxDB instance and writes the generated data.
- Allows users to configure the InfluxDB connection and data generation parameters via command-line arguments.

## Requirements

Before using the script, you need to install the required dependencies listed in `requirements.txt`.

To install the required Python modules, run:

```bash
pip install -r requirements.txt
```

## Usage

You can execute `writer.py` with the following command:

```bash
python writer.py [options]
```

or simply use the `run_writer.sh` script:

```bash
# Installs all the requirements and runs the writer
source run_writer.sh [options]
```

### Options:
- `--host`: (Optional) Hostname or IP address of the InfluxDB instance. Default is `localhost`.
- `--db`: (Optional) Name of the InfluxDB database to write data to. Default is `iot_monitoring_station`.
- `--username`: (Optional) InfluxDB username. Default is `root`.
- `--password`: (Optional) InfluxDB password. Default is `root`.

### Example:

To write data to a local InfluxDB instance:

```bash
# Explicit argument specification
python writer.py --host "localhost" --db "iot_monitoring_station" --username "root" --password "root"

# Implicit argument specification
python writer.py
```

The script will continuously generate and send data to the InfluxDB instance every 5 seconds.

## Script Details

- **Infinite Loop**: The script will run indefinitely, generating and sending data every 5 seconds.
- **Data Generation**: Random values are generated for temperature, humidity, and battery measurements.
- **Data Writing**: The generated data is written to InfluxDB with the associated timestamp, tags, and value.

