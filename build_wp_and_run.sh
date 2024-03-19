#!/bin/bash

# Load environment variables from .env file
if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

# Stop any running containers of this name
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Run docker system prune -a
# docker system prune -a -f

# Build the Docker image
docker build -t $DOCKER_IMAGE_NAME .

# Run the container locally
docker run -p 8080:80 --name $CONTAINER_NAME $DOCKER_IMAGE_NAME
