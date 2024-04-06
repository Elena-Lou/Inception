#!/bin/sh

mariadb --user=root --password=$MYSQL_ROOT_PASSWORD --silent --execute "SELECT 1"
exit $?;