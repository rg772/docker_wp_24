# Load environment variables from .env file
if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi


# Run WP-CLI commands inside the WordPress container
docker exec -it $CONTAINER_NAME wp core install --url=http://localhost:8080 --title=MySite --admin_user=admin --admin_password=password --admin_email=admin@example.com
docker exec -it $CONTAINER_NAME wp theme activate my-theme
docker exec -it $CONTAINER_NAME wp user create john doe@example.com --role=author --user_pass=secret

# Print a success message
echo "WP-CLI commands executed inside the WordPress container."