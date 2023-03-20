#!/bin/bash

#mysql_install_db

config_file=`mktemp`
#if [! -f "$config_file"]; then
#	echo " /!\ config_file not found /!\ "
#	return 1
#fi

echo config_file created


cat << _EOF_ > $config_file

CREATE DATABASE IF NOT EXISTS wordpress;

CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';

GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';

FLUSH PRIVILEGES;

_EOF_


cat $config_file

mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < $config_file
exec mysqld --user --console --skip-name-resolve --skip-networking=0 $@
