#!/bin/sh

service apache2 start

service mysql start
mysql -uroot < /my.sql

service postgresql start
su - postgres -c "psql < /pg.sql"


