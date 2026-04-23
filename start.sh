#!/bin/bash
set -e

echo "=== Starting ByteLearn ==="

# Step 1: Auto-create database if it doesn't exist
echo "Creating database if needed..."
php /var/www/html/create_db.php

# Step 2: Run migrations
echo "Running migrations..."
php artisan migrate --force

# Step 3: Fix permissions
echo "Setting permissions..."
chown -R www-data:www-data storage bootstrap/cache
chmod -R 775 storage bootstrap/cache

echo "=== Starting Apache ==="

# Step 4: Start Apache
exec apache2-foreground