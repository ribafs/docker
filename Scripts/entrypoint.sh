#!/bin/sh
set -e

echo "Service 'All': Status"

rc-status -a

echo "Service 'RSyslog': Starting ..."

rc-service rsyslog start


if [ "$1" = 'httpd' ]; then
  echo "Command: '$@'"

  echo "Service '$1': Launching ..."
fi

echo "Service 'All': Status"

rc-status -a

echo "Softlevel File:"
echo "'$(cat /run/openrc/softlevel)'"

exec $@
