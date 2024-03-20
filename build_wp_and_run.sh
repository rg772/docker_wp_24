#!/bin/bash

# Load environment variables from .env file
if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

# Run docker system prune -a
# docker system prune -a -f

# Build the Docker image
docker build -t $DOCKER_IMAGE_NAME .

# Run the container locally
docker run -d -p 8080:80 --name $CONTAINER_NAME $DOCKER_IMAGE_NAME

# Add WP-CLI to the container
#docker exec -it $CONTAINER_NAME bash -c "curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp"
  
# CLI... reference
echo To get SSH in
echo docker exec -it $CONTAINER_NAME /bin/bash    

