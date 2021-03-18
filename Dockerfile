# Instal ubuntu
FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y software-properties-common

# Install Nginx.
RUN \
add-apt-repository -y ppa:nginx/stable && \
apt-get update && \
apt-get install -y nginx && \
rm -rf /var/lib/apt/lists/* && \
chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME [“/etc/nginx/sites-enabled”, “/etc/nginx/certs”, “/etc/nginx/conf.d”, “/var/log/nginx”, “/var/www/html”]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx", "-g", "daemon off;"]

# Expose ports.
EXPOSE 80
EXPOSE 443