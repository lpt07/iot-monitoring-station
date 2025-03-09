#!/bin/bash

# Build a custom docker image for the Flask App
docker build -t flask-app 

# Run the Flask App docker container (map port 5000 from the container to the local port 5000)
docker run -p 5000:5000 flask-app