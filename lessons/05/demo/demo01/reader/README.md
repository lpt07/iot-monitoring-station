
# InfluxDB Reader

The `reader.py` script is designed to connect to an InfluxDB instance, query data from the specified database, and output the results. It queries for data in the last 5 minutes based on a specified time range and measurement type.

## Features

- Connects to InfluxDB using user-provided credentials and database information.
- Queries data from the last 5 minutes based on timestamp.
- Logs the results to the console, showing the last 5 data points (or fewer if there are less than 5 results).

## Requirements

Before using the script, you need to install the required dependencies listed in `requirements.txt`.

To install the required Python modules, run:

```bash
pip install -r requirements.txt
```

## Usage

You can execute `reader.py` with the following command:

```bash
python reader.py [options]
```

or simply use the `run_reader.sh` script:

```bash
# Installs all the requirements and runs the reader
source run_reader.sh [options]

### Options:
- `--host`: (Optional) Hostname or IP address of the InfluxDB instance. Default is `localhost`.
- `--db`: (Optional) Name of the InfluxDB database to query. Default is `iot_monitoring_station`.
- `--username`: (Optional) InfluxDB username. Default is `root`.
- `--password`: (Optional) InfluxDB password. Default is `root`.

### Example:

To read data from a local InfluxDB instance:

```bash
# Explicit argument specification
python reader.py --host "localhost" --db "iot_monitoring_station" --username "root" --password "root"

# Implicit argument specification
python reader.py
```

The script will continuously query and log the data for the last 5 minutes.

## Script Details

- **Infinite Loop**: The script runs indefinitely, querying data every 5 seconds.
- **Time Range**: The script queries data for the last 5 minutes based on the current time.
- **Data Logging**: The script will log the number of results returned and display the last 5 results (or fewer).

