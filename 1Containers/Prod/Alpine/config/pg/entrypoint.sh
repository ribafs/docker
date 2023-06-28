#!/bin/sh
set -e

echo "Service 'All': Status"
rc-status -a

echo "Service 'PostgreSQL': Starting ..."

DIR="/run/postgresql"
if [ -d "$DIR" ]; then
  echo "A pasta ${DIR} já existe"
else
  mkdir $DIR
fi

mkdir /var/lib/postgresql/data
chown postgres:postgres /run/postgresql/
chmod 0700 /var/lib/postgresql/data
chown -R postgres:postgres /var/lib/postgresql/data

rc-service postgresql start
su - postgres -c "psql < /pg.sql"

sed -i "s/127.0.0.1\/32/172.17.0.3\/32/" /etc/postgresql/pg_hba.conf
sed -i "s/#listen_addresses\ =\ 'localhost'/listen_addresses\ =\ '*'/" /etc/postgresql/postgresql.conf

rc-service postgresql restart

if [ "$1" = 'postgresql' ]; then
  echo "Comando: '$@'"
  echo "Serviço '$1': Iniciando ..."
fi

exec $@

