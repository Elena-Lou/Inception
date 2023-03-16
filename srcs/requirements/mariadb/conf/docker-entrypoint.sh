#!/bin/bash

mysql_install_db

service mysql start

#mysql -e "SELECT user,authentication_string,plugin,host FROM mysql.user;"

mysql -e "DELETE FROM mysql.user WHERE user='' ;"

#mysql -e "DROP USER ''@'$(hostname)';"

mysql -e "DROP DATABASE test;"

echo "\n --- DataBase dropped --- \n"

mysql -e "SELECT user,authentication_string,plugin,host FROM mysql.user;"

mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;"

mysql -e "SHOW DATABASES;"

echo "\n --- creation user Bouh --- \n"

mysql -e "CREATE USER IF NOT EXISTS 'bouh'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"

mysql -e "SELECT user FROM mysql.user;"

mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'bouh'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"

echo "\n --- user bouh receives all privileges on wordpress --- \n"

mysql -e "SELECT user,authentication_string,plugin,host FROM mysql.user;"

#mysql -e "UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE user = 'root';"

#mysql -e "UPDATE mysql.user SET password = PASSWORD('IMANEWPWD') WHERE user = 'root';"

echo "\n --- password set for root user --- \n"

mysql -e "FLUSH PRIVILEGES;"

service mysql stop

exec "$@"
