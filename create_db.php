<?php

$host = getenv('DB_HOST');
$port = getenv('DB_PORT') ?: '3306';
$user = getenv('DB_USERNAME');
$pass = getenv('DB_PASSWORD');
$db   = getenv('DB_DATABASE');
$ssl  = getenv('MYSQL_ATTR_SSL_CA') ?: '/etc/ssl/certs/ca-certificates.crt';

echo "Attempting to create database '$db'...\n";

try {
    $pdo = new PDO(
        "mysql:host=$host;port=$port",
        $user,
        $pass,
        [
            PDO::MYSQL_ATTR_SSL_CA => $ssl,
            PDO::MYSQL_ATTR_SSL_VERIFY_SERVER_CERT => false,
        ]
    );
    $pdo->exec("CREATE DATABASE IF NOT EXISTS `$db`");
    echo "Database '$db' is ready.\n";
} catch (Exception $e) {
    echo "Warning: Could not create database: " . $e->getMessage() . "\n";
}
