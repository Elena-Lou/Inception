#!/bin/bash

if [ ! -f /var/www/wordpress/wp-config.php ]; then

	echo BEFORE DOWNLOAD 

	wp core download --allow-root \
		--path='/var/www/wordpress'
	
	echo CORE DOWNLOAD COMPLETE
	
	echo BEFORE CONFIG CREATE
	
	wp config create --allow-root \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb:3306 \
		--path='/var/www/wordpress/'

	echo AFTER CONFIG CREATE

	echo BEFORE CORE INSTALL

	wp core install --allow-root \
		--url=$WP_URL \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMIN_PWD \
		--admin_email=$WP_ADMIN_EMAIL \
		--skip-email \
		--path='/var/www/wordpress/'

	echo AFTER CORE INSTALL

	echo BERFORE USER CREATE

	wp user create --allow-root \
		$WP_USER \
		$WP_USER_EMAIL \
		--user_pass=$WP_USER_PWD \
		--role=author \
		--path='/var/www/wordpress/'
	
	echo AFTER USER CREATE 
else 
	echo /var/www/wordpress/wp-config.php already created 

fi

exec "$@"
