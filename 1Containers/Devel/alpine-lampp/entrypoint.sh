#!/bin/sh
set -e

echo "Service 'All': Status"
rc-status -a

echo "Service 'Apache': Starting ..."
rc-service apache2 restart

if [ "$1" = 'httpd' ]; then
  echo "Comando: '$@'"
  echo "Serviço '$1': Iniciando ..."
fi

echo "Service 'MariaDB': Starting ..."

/etc/init.d/mariadb setup
rc-service mariadb start
mariadb -uroot < /var/www/localhost/htdocs/ma.sql

if [ "$1" = 'mysql' ]; then
  echo "Comando: '$@'"  
  echo "Serviço '$1': Iniciando ..."
fi

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
rc-service postgresql restart

su - postgres -c "psql < /var/www/localhost/htdocs/pg.sql"

if [ "$1" = 'postgresql' ]; then
  echo "Comando: '$@'"
  echo "Serviço '$1': Iniciando ..."
fi

exec $@

