# Configurações de pos-install

docker exec -it maria-container sh

rc-service mariadb start

/etc/init.d/mariadb setup

rc-service mariadb start

mysql -uroot

create database testes;

\q
```bash
mysql -uroot testes < /setup.sql
```
mysql -uroot

use testes

select *from clients;

## Criar usuário com privilégios sobre o banco testes

select User,Password,Host from mysql.user;

CREATE USER 'super'@'localhost' IDENTIFIED BY 'super';
GRANT ALL PRIVILEGES ON *.* TO 'super'@'localhost';

CREATE USER 'super'@'fqdn' IDENTIFIED BY 'super';
GRANT ALL PRIGILEGES ON *.* TO 'super'@'fqdn';

CREATE USER 'super'@'%' IDENTIFIED BY 'super';
GRANT ALL PRIVILEGES ON *.* TO 'super'@'%';

FLUSH PRIVILEGES;
\q

mysql -usuper -p

nano /etc/hosts

127.0.0.1   maria

nano /etc/my.cnf

# This group is read both both by the client and the server
# use it for options that affect everything
[client-server]

# This group is read by the server
[mysqld]

# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0

# include all files from the config directory
!includedir /etc/my.cnf.d

[mysqld]

skip-networking=0
skip-bind-address

rc-service mariadb restart

exit

https://mariadb.com/kb/en/configuring-mariadb-for-remote-client-access/
https://www.digitalocean.com/community/tutorials/como-criar-um-novo-usuario-e-conceder-permissoes-no-mysql-pt

