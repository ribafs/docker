# Configurações pos-install

docker exec -it adminer-container sh

rc-service apache2 start

Configurar php.ini

nano /etc/php7/php.ini

display_errors = On

Configurar apache

nano /etc/apache2/httpd.conf

ServerName localhost

Trocar as 3 ocorrências de

AllowOverride None

por

AllowOverride All

rc-service apache2 restart

Acesso pelo desktop

ifconfig

http://172.31.0.2

System - PostgreSQL depois MySQL
Server - postgres depois maria
Username - super
Password - super
Banco - testes


