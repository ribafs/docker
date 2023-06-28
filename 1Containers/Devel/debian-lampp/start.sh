#!/bin/sh

service apache2 start

service mariadb start
mariadb -uroot < /var/www/html/my.sql

service postgresql start
su - postgres -c "psql < /var/www/html/pg.sql"


