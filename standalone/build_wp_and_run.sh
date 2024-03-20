#!/bin/bash

# Load environment variables from .env file
if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

# Build the Docker image
docker build -t $DOCKER_IMAGE_NAME .

# Run the container locally
docker run -d -p 8080:80 --name $CONTAINER_NAME $DOCKER_IMAGE_NAME


