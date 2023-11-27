# Inception

Set up a small infrastucture of three services running on three different containers using docker compose.

## Subject requirements
- A Docker container that contains NGINX with TLSv 1.2
- A Docker container that contains WordPress + php-fpm without NGINX
- A Docker container that contains MariaDB without NGINX
- A volume for the Wordpress database
- A second volume for the Wordpress files
- A docker-network which explicitly connects all three containers
- An admin and a regular user must be set before the website is launched
- The project must be completed on a Virtual Machine

