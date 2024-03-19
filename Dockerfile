# Use an official WordPress image as the base
FROM wordpress:latest

# Install MariaDB client (needed for initialization)
RUN apt-get update && apt-get install -y mariadb-client

# Copy your SQL schema file into the container
COPY ./schema.sql /docker-entrypoint-initdb.d/

# Expose port 80 (the default WordPress port)
EXPOSE 80

# Start the WordPress application
CMD ["apache2-foreground"]
