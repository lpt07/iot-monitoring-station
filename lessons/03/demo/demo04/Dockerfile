# Use an official Ubuntu image as a base image
FROM ubuntu:latest

# Update the package list and install cowsay and other necessary utilities
RUN apt-get update && \
    apt-get install -y cowsay && \
    apt-get clean

# Update the PATH to include the directory where cowsay is located
ENV PATH="/usr/games:${PATH}"

# Set the default command to run cowsay with a custom message
CMD ["cowsay", "Hello from the Docker world!"]
