# Use the official Ubuntu 18.04 base image
FROM ubuntu:18.04

# Install NGINX 1.14
RUN apt-get update && apt-get install -y nginx=1.14.*

# Remove the default NGINX index.html file
RUN rm /var/www/html/index.nginx-debian.html

# Copy the custom index.html file to the NGINX web directory
COPY index.html /var/www/html/

# Copy the image to the NGINX default directory
COPY banner.png /var/www/html/banner.png

# Expose port 8081
EXPOSE 8090

# Start NGINX in the foreground, listening on port 8090
CMD ["nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]
