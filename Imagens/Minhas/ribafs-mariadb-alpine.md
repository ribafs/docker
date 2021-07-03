# Imagem ribafs/mariadb

ribafs/mariadb - https://hub.docker.com/repository/docker/ribafs/mariadb

- alpine
- mysql-server

docker pull alpine

docker run -dt alpine

docker ps

docker exec -it ID sh

apk search -v 'mysql*' | sort

apk add mysql mysql-client

Adicionar rc-service

apk add openrc --no-cache

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

