#!/bin/bash

# Start a NGINX docker container (map the local port 8080 to the container's port 80)
docker run -d -p 8080:80 nginx