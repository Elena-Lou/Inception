#!/bin/bash

	wp-cli.phar core download --allow-root \
		--path='/var/www/wordpress/'

sleep 5
	
	wp-cli.phar config create --allow-root \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb:3306 \
		--path='/var/www/wordpress/'
sleep 5

	wp-cli.phar core install --allow-root \
		--url=$WP_URL \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMIN_PWD \
		--admin_email=$WP_ADMIN_EMAIL \
		--skip-email \
		--path='/var/www/wordpress/'

	wp-cli.phar user create --allow-root \
		$WP_USER \
		$WP_USER_EMAIL \
		--user_pass=$WP_USER_PWD \
		--role=author \
		--path='/var/www/wordpress/'

	wp-cli.phar theme install twentytwenty --allow-root \
	       	--activate \
		--path='/var/www/wordpress/'

exec "$@"
