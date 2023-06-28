#!/bin/sh

service mariadb start
mariadb -uroot < /ma.sql

sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/#skip-name-resolve/skip-grant-tables/" /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb restart
