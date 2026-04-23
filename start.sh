#!/bin/bash

# Auto-create the database if it doesn't exist
php -r "
\$host = getenv('DB_HOST');
\$port = getenv('DB_PORT') ?: '3306';
\$user = getenv('DB_USERNAME');
\$pass = getenv('DB_PASSWORD');
\$db   = getenv('DB_DATABASE');
\$ssl  = getenv('MYSQL_ATTR_SSL_CA') ?: '/etc/ssl/certs/ca-certificates.crt';

try {
    \$pdo = new PDO(
        \"mysql:host=\$host;port=\$port\",
        \$user, \$pass,
        [PDO::MYSQL_ATTR_SSL_CA => \$ssl, PDO::MYSQL_ATTR_SSL_VERIFY_SERVER_CERT => false]
    );
    \$pdo->exec(\"CREATE DATABASE IF NOT EXISTS \\\`\$db\\\`\");
    echo \"Database '\$db' ready.\n\";
} catch (Exception \$e) {
    echo 'DB create warning: ' . \$e->getMessage() . \"\n\";
}
"

# Run database migrations
php artisan migrate --force

# Ensure permissions are correct for Apache
chown -R www-data:www-data storage bootstrap/cache

# Start Apache
apache2-foreground