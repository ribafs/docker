#!/bin/sh

service postgresql start
su - postgres -c "psql < /pg.sql"

sed -i "s/127.0.0.1\/32/172.17.0.0\/24/" /etc/postgresql/13/main/pg_hba.conf

sed -i "s/#listen_addresses/listen_addresses/" /etc/postgresql/13/main/postgresql.conf
sed -i "s/localhost/*/" /etc/postgresql/13/main/postgresql.conf

service postgresql restart
