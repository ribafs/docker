#!/bin/sh

a2enmod rewrite

service apache2 start

service mysql start
mysql -uroot < /var/www/html/my.sql

