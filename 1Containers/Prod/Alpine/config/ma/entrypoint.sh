#!/bin/sh
set -e

echo "Service 'All': Status"
rc-status -a

echo "Service 'MariaDB': Starting ..."

/etc/init.d/mariadb setup
rc-service mariadb start
mariadb -uroot < /ma.sql

if [ "$1" = 'mysql' ]; then
  echo "Comando: '$@'"  
  echo "Serviço '$1': Iniciando ..."
fi

exec $@

