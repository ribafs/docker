#!/bin/sh

service apache2 start

service mysql start
mysql -uroot < /var/www/html/my.sql

echo 'alias cw="cd /var/www/html"' >> /root/.bashrc
echo 'alias c="clear"' >> /root/.bashrc
echo 'alias apr="service apache2 restart"'  >> /root/.bashrc
echo 'alias mar="service mariadb restart"' >> /root/.bashrc
echo 'alias pgr="service postgresql restart"' >> /root/.bashrc

