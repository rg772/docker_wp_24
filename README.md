# Dockerized WordPress Project

This project sets up a local WordPress environment using Docker. Docker allows you to package an application with all of its dependencies into a standardized unit for software development.

## Prerequisites

- Docker: You need to have Docker installed on your machine. Docker is a platform that uses OS-level virtualization to deliver software in packages called containers.

## Setup

1. **Clone the repository**: Use git clone to copy the project repository to your local machine.

2. **Create a `.env` file**: This file will contain the environment variables needed for the Docker container. The `.env` file should be in the root directory of the project and contain the following:

    ```env
    MYSQL_ROOT_PASSWORD=rootpassword
    MYSQL_DATABASE=mydb
    MYSQL_USER=myuser
    MYSQL_PASSWORD=mypassword
    CONTAINER_NAME=wordpress_mama
    DOCKER_IMAGE_NAME=test-wp
    ```

    Replace the values with your actual database credentials and desired container name. The `DOCKER_IMAGE_NAME` is the name of the Docker image that will be built and run.

2b. **Set up environment variables in Amazon ECS**: Instead of using a .env file, you can set up these environment variables directly in your Amazon ECS task definition. When creating a new task definition, under the “Container Definitions” section, add the same key-value pairs as above in the “Environment variables” section.

3. **Run the `build_wp_and_run.sh` script**: This script is located in the root directory of the project. It stops any running Docker containers with the same name as specified in the `.env` file, builds a new Docker image with the specified name, and runs a new Docker container. You can run the script with the following command:

    ```bash
    ./build_wp_and_run.sh
    ```

4. **Access your WordPress site**: Once the Docker container is running, you can access your WordPress site by navigating to `http://localhost:8080` in your web browser.

![WP Graphic](https://github.com/rg772/docker_wp_24/blob/main/OTHER/8080.png?raw=true)


## Note

The `build_wp_and_run.sh` script exports the environment variables from the `.env` file, so they are accessible within the script. If the `.env` file does not exist, the script will not run correctly.
# docker_wp_24
