#!/bin/bash

service mysql start

echo "Waiting for service.."
sleep 3

while [ ! -e /var/run/mysqld/mysqld.sock ]; do
	echo nope
	sleep 2
done

echo "service is ready"

mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"

mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

#mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"

mysql -e "FLUSH PRIVILEGES;"

sleep 3

service mysql stop
#mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

exec $@
