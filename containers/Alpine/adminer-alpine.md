# Container com adminer

E alpine

adminer com alpine

docker pull alpine

docker run -t -d --name meu_adminer alpine

docker images - 5.58MB

docker exec -it meu_adminer sh

apk add adminer

https://wiki.alpinelinux.org/wiki/Setting_Up_Apache_with_PHP

Habilitar os repositórios
```bash
cat > /etc/apk/repositories << EOF
http://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/main
http://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/community
EOF
```
apk update

Adicionar os pacotes principais

export phpverx=$(alpinever=$(cat /etc/alpine-release|cut -d '.' -f1);[ $alpinever -ge 9 ] && echo  7|| echo 5)

Apache e PHP

apk add apache2 php7-apache2

apk add nano

apk add openrc --no-cache

rc-service apache2 start

Deixar apache no boot

rc-update add apache2

MariaDB

https://wiki.alpinelinux.org/wiki/Mysql#MySQL_.28MariaDB.29_-_Production_usage

apk add mysql mysql-client

mysql_install_db --user=mysql --datadir=/var/lib/mysql

rc-service mariadb start

mysqladmin -u root password toor

mysqladmin: connect to server at 'localhost' failed
error: 'Can't connect to local MySQL server through socket '/run/mysqld/mysqld.sock' (2)'
Check that mysqld is running and that the socket: '/run/mysqld/mysqld.sock' exists!
Será por conta do mysql do host

rc-service mariadb restart

Dicas

docker run --link some_database:db -p 8080:8080 adminer

# Use root/example as user/password credentials

version: '3.1'

services:

  adminer:
    image: adminer
    restart: always
    ports:
      - 8080:8080

  db:
    image: mysql:5.6
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: example
