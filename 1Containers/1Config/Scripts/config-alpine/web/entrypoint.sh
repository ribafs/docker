#!/bin/sh
set -e

echo "Service 'All': Status"
rc-status -a

echo "Service 'Apache': Starting ..."
rc-service apache2 restart

echo "172.17.0.2    postgres" >> /etc/hosts

if [ "$1" = 'httpd' ]; then
  echo "Comando: '$@'"
  echo "Serviço '$1': Iniciando ..."
fi

exec $@

