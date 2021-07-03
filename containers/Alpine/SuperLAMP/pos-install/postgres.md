# Configurações de pos-install

docker exec -it postgres-container sh

rc-service postgresql start

nano /etc/postgresql/pg_hba.conf

= IPv4 local connections:
ENV IP docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' apache-container

host    all             all             127.0.0.1/32            md5
host    all             all             $IP/24                trust

nano /etc/postgresql/postgresql.conf

#listen_addresses = 'localhost'
listen_addresses = '*'

ou

listen_addresses = '172.31.0.3'

listen_addresses='172.31.0.2 172.31.0.3'

rc-service postgresql restart

Criar super - com todos os privilégios

createuser -P -s -e joe

psql -U postgres postgres <<OMG
 CREATE USER super with login superuser password 'super' ;
OMG

RUN su - postgres \
    psql -c "CREATE ROLE super WITH LOGIN SUPERUSER PASSWORD 'super';" \
    create database testes
    psql -U super testes < /setup.sql \

Agora vou conectar no desktop através do adminer (172.31.0.2) via web (172.31.0.3) usando o super

nano /etc/hosts

http://172.31.0.2

rc-service postgresql restart

System - PostgreSQL
Server - 172.26.0.2
Username - super
Password - super
Banco - testes

nano /etc/hosts

127.0.0.1   postgres


