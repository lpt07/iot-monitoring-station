#!/bin/bash

# Build a custom docker image for cowsay (https://linux.die.net/man/1/cowsay)
docker build -t cowsay-image .

# Run the image
docker run cowsay-image