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

exec $@

