# Bytelearn - Laravel Application

This is a Laravel-based learning management system.

## Deployment to Render

### Prerequisites
- GitHub repository with this code
- Render account

### Steps

1. **Create a MySQL Database on Render**
   - Go to Render Dashboard > Databases
   - Create a new MySQL database
   - Note the connection details

2. **Create a Web Service**
   - Go to Render Dashboard > New > Web Service
   - Connect your GitHub repository
   - Select branch (main/master)
   - Runtime: Docker
   - Build Command: (leave empty, uses Dockerfile)
   - Start Command: (leave empty, uses CMD in Dockerfile)

3. **Set Environment Variables**
   In the service settings, add these environment variables:

   ```
   APP_NAME=Bytelearn
   APP_ENV=production
   APP_KEY=base64:/tiFTk5cy7QVhkI5sj3BdLlKX3xYWrQ2r5obXMSBVj8=  # Generate with: php artisan key:generate --show
   APP_DEBUG=false
   APP_URL=https://your-render-app-url.onrender.com

   DB_CONNECTION=mysql
   DB_HOST=<from Render database>
   DB_PORT=<from Render database>
   DB_DATABASE=<from Render database>
   DB_USERNAME=<from Render database>
   DB_PASSWORD=<from Render database>

   SESSION_DRIVER=database
   CACHE_STORE=database
   QUEUE_CONNECTION=database
   ```

4. **Deploy**
   - Render will build the Docker image and deploy
   - The start script will run migrations automatically

### Local Development

1. Clone the repository
2. Run `composer setup` (installs dependencies, sets up .env, migrates, builds assets)
3. Start with `composer dev` (runs server, queue, logs, vite)

## About Laravel

Laravel is a web application framework with expressive, elegant syntax...

In order to ensure that the Laravel community is welcoming to all, please review and abide by the [Code of Conduct](https://laravel.com/docs/contributions#code-of-conduct).

## Security Vulnerabilities

If you discover a security vulnerability within Laravel, please send an e-mail to Taylor Otwell via [taylor@laravel.com](mailto:taylor@laravel.com). All security vulnerabilities will be promptly addressed.

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
