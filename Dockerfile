# Use the official Ubuntu base image
FROM ubuntu:latest

# Update the package list and install Apache
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the custom HTML file into the container
COPY index.html /var/www/html/

# Copy custom Apache configuration file into the container
COPY my-apache.conf /etc/apache2/sites-available/000-default.conf

# Expose port 80 for incoming HTTP traffic
EXPOSE 80

# Start Apache in the foreground when the container runs
CMD ["apachectl", "-D", "FOREGROUND"]

