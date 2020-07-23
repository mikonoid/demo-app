#!/bin/sh

# Generate page with short commit ID
git rev-parse --short HEAD > /var/www/index.html

# Start Nginx webserver
/usr/sbin/nginx -g 'daemon off;'
