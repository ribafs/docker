postgres - 172.17.0.2

sh /ph.sh

Configurar
pg_hba.conf
postgresql.conf

web - 172.17.0.3

sh /var/www/html/web.sh

mysql - 172.17.0.4

sh /my.sh

nano /etc/mysql/mysql.conf.d/mysqld.cnf

[mysqld]
bind-address = 0.0.0.0
skip-grant-tables

service mysql restart

