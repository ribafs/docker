# LAMP com alpina

https://wiki.alpinelinux.org/wiki/Setting_Up_Apache_with_PHP

docker pull alpine-img

docker run -dt --name alpine-cont alpine-img

docker ps

docker exec -it alpine-cont sh

Habilitar os repositórios

cat > /etc/apk/repositories << EOF
http://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/main
http://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/community
EOF

Adicionar repositório

echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

apk update

Adicionar os pacotes principais

export phpverx=$(alpinever=$(cat /etc/alpine-release|cut -d '.' -f1);[ $alpinever -ge 9 ] && echo  7|| echo 5)

Apache e PHP

apk add apache2 php7-apache2

Testando

apk add nano

nano /var/www/localhost/htdocs/index.php

<?php
phpinfo();

Iniciar apache

rc-service apache2 start

Deixar apache no boot

rc-update add apache2

MariaDB

https://wiki.alpinelinux.org/wiki/Mysql#MySQL_.28MariaDB.29_-_Production_usage

apk add mysql mysql-client

mysql_install_db --user=mysql --datadir=/var/lib/mysql

rc-service mariadb start

mysqladmin -u root password toor

rc-service mariadb restart

cat > /etc/my.cnf.d/mariadb-server-default-charset.cnf << EOF
[client]
default-character-set = utf8mb4

[mysqld]
collation_server = utf8mb4_unicode_ci
character_set_server = utf8mb4

[mysql]
default-character-set = utf8mb4
EOF

https://wiki.alpinelinux.org/wiki/Production_LAMP_system:_Lighttpd_%2B_PHP_%2B_MySQL


