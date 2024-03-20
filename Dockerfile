# Use an official WordPress image as the base
FROM wordpress:latest




# Expose port 80 (the default WordPress port)
EXPOSE 80



# Start the WordPress application
CMD ["apache2-foreground"]
