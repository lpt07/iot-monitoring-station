#!/bin/bash

pip install -r requirements.txt &> /dev/null

python sensor.py "$@"
