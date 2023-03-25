#!/bin/bash

service mysql start

while [ ! -e /var/run/mysqld/mysqld.sock ]; do
	echo waiting for service 
	sleep 2
done

echo "service is ready"

sleep 3

mysql << _EOF_

CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;

ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';

CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';

GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';

ALTER USER root@localhost IDENTIFIED WITH mysql_native_password;

FLUSH PRIVILEGES;

_EOF_

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

exec $@
