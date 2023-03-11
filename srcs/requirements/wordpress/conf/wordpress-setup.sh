#!/bin/bash

curl -LO https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
chown -R www-data:www-data /var/www/wordpress
i=0
while [ $i -le 7 ];
do
	sed -i "0,/put your unique phrase here/s//`pwgen -s 64`/" wp-config.php
	((i++))
done
exec "$@"
