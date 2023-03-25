#!/bin/bash

service mysql start

echo "Waiting for service.."
sleep 3

while [ ! -e /var/run/mysqld/mysqld.sock ]; do
	echo nope
	sleep 2
done

set -x 

echo "service is ready"

mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"

mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"



mysql -u -root -p$MYSQL_ROOT_PASSWORD -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password;"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

set +x

sleep 3

#service mysql stop
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

exec $@
