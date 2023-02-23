#!/bin/bash

ARG MYSQL_ROOT_PASSWORD=my_root_password
ARG MYSQL_USER=wordpress_db_user
ARG MYSQL_PASSWORD=wordpress_db_user
ARG ROOT_PASSWORD=inceptionMDP

mysql_install_db

service mysql start

mysql -e "UPDATE mysql.user SET password = PASSWORD('IMANEWPWD') WHERE user = 'root';"

mysql -e "DROP USER ''@'localhost';"

mysql -e "DROP USER ''@'$(hostname)';"

mysql -e "DROP DATABASE test;"

mysql -e "FLUSH PRIVILEGES;"

#mysql -e "SELECT user,authentication_string,plugin,host FROM mysql.user;"

#mysql -e "UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE user = 'root';"

mysql -e "SELECT user,authentication_string,plugin,host FROM mysql.user;"

mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;"

mysql -e "SHOW DATABASES;"

mysql -e "CREATE USER IF NOT EXISTS 'bouh'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"

mysql -e "SELECT user FROM mysql.user;"

mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'bouh'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"

mysql -e "FLUSH PRIVILEGES;"

exec "$@"
