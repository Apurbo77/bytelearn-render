#!/bin/bash

# Run database migrations
php artisan migrate --force

# Ensure permissions are correct for Apache
chown -R www-data:www-data storage bootstrap/cache

# Start Apache
apache2-foreground