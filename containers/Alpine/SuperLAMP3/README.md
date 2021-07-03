# Criar containers com Alpine numa rede

- adminer
- postgres
- maria
- sqlite
- apache e php (web)

docker-compose.yml e respectivos Dockerfiles

## Execução

docker-compose down -v

docker-compose up -d

docker images

REPOSITORY     TAG       IMAGE ID       CREATED          SIZE
alp_adminer    latest    79b88c881037   15 minutes ago   49.9MB
alp_sqlite     latest    c46b194da8a8   16 minutes ago   18.8MB
alp_web        latest    8b6ad70480c5   16 minutes ago   113MB
alp_maria      latest    f5a05ba1cd61   17 minutes ago   231MB
alp_postgres   latest    e34819d447c3   18 minutes ago   161MB
alpine         edge      430cc6504dbd   5 days ago       5.61MB

docker ps

CONTAINER ID   IMAGE          COMMAND                  CREATED              STATUS              PORTS                    NAMES
a990b8c35d34   alp_web        "/sbin/init"             About a minute ago   Up About a minute   0.0.0.0:8888->80/tcp     web-container
1815487abea0   alp_adminer    "/sbin/init /bin/sh …"   About a minute ago   Up About a minute   80/tcp                   adminer-container
a189749493fa   alp_postgres   "/sbin/init"             About a minute ago   Up About a minute   0.0.0.0:6432->5432/tcp   postgres-container
aea7547b0bc0   alp_sqlite     "/bin/sh"                About a minute ago   Up About a minute                            sqlite-container
9027c0f82d30   alp_maria      "/sbin/init"             About a minute ago   Up About a minute   0.0.0.0:3333->3306/tcp   maria-container

docker network ls

NETWORK ID     NAME             DRIVER    SCOPE
d29242d1baa7   alp_alpine-net   bridge    local
f7232e7f4b0c   bridge           bridge    local
c6c912ff7b73   host             host      local
26e0dd2a6146   none             null      local

Nossa rede foi criada com no nome

alp_alpine-net

alp - nome do diretório do projeto
alpine-net - o nome que demos no docker-compose.yml

As demais redes são default do docker

Inspecionemos nossa rede

docker network inspect alp_alpine-net 
[
    {
        "Name": "alp_alpine-net",
        "Id": "094fabd2569f7bd05a02f4e0d4121ca43c6178fff69692f7988b3d65248c332f",
        "Created": "2020-12-24T12:31:15.988136313-03:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.31.0.0/16",
                    "Gateway": "172.31.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": true,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "1815487abea04d973a2a6d55677df4ef70589f204d9b0c333ff1e72b2f97c28b": {
                "Name": "adminer-container",
                "EndpointID": "c52f2dbc382fedc6b27170b5945ee876aa77e8bccfe8854112c8fecf5f70153c",
                "MacAddress": "02:42:ac:1f:00:02",
                "IPv4Address": "172.31.0.2/16",
                "IPv6Address": ""
            },
            "9027c0f82d306599645b6be8b6d35b360f44759703b373fd2c1fd4d6e830f5a9": {
                "Name": "maria-container",
                "EndpointID": "17c24d7ce34ec8066286de5ab77c4239659ba8d02420b4f2693312102f864e9e",
                "MacAddress": "02:42:ac:1f:00:05",
                "IPv4Address": "172.31.0.5/16",
                "IPv6Address": ""
            },
            "a189749493facbb8ac0f55f362b0d1936b2972a8cbda0c8e8b1173809d3793cc": {
                "Name": "postgres-container",
                "EndpointID": "d3f5f491629051cfe224b35c7b451de16b1716b798180c38b8c75bf41e05bc61",
                "MacAddress": "02:42:ac:1f:00:04",
                "IPv4Address": "172.31.0.4/16",
                "IPv6Address": ""
            },
            "a990b8c35d3415d1804d5f87b496e021907b6ec18969557dd89b76e9bb32c38e": {
                "Name": "web-container",
                "EndpointID": "7924bd4c968cd7f08e554bbfd4f2c8b5e6dd51272f28f2b7ea4c52ea440466ee",
                "MacAddress": "02:42:ac:1f:00:03",
                "IPv4Address": "172.31.0.3/16",
                "IPv6Address": ""
            },
            "aea7547b0bc0982563a80b4081e53ad340394f60c901ecd5c5b243a50ac7842e": {
                "Name": "sqlite-container",
                "EndpointID": "369449285bb5bb8c515f4fe658a0d42e8e88317540be5c8639804a956833586c",
                "MacAddress": "02:42:ac:1f:00:06",
                "IPv4Address": "172.31.0.6/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {
            "com.docker.compose.network": "alpine-net",
            "com.docker.compose.project": "alp",
            "com.docker.compose.version": "1.21.2"
        }
    }
]

adminer - 172.31.0.2
web - 172.31.0.3
postgres - 172.31.0.4
maria - 172.31.0.5
sqlipte - 172.31.0.6

Todos na rede 172.31.*

## web

Criar o index.php em /var/www/localhost/htdocs

Contendo as conexões via PDO para maria, postgres e sqlite

Configurar php.ini

nano /etc/php7/php.ini

display_errors = ON

Configurar apache

nano /etc/apache2/httpd.conf

ServerName localhost

Trocar as 3 ocorrências de

AllowOverride None

por

AllowOverride All

rc-service apache2 restart

## postgres

rc-service postgresql start

nano /etc/postgresql/pg_hba

= IPv4 local connections:
host    all             all             172.26.0.0/24           md5

nano /etc/postgresql/postgresql.conf

listen_addresses = '*'

ou

listen_addresses = '172.31.0.3'

listen_addresses='172.31.0.2 172.31.0.3'

rc-service postgresql restart

Criar super - com todos os privilégios

sudo su
su - postgres
psql

CREATE ROLE super WITH LOGIN SUPERUSER PASSWORD 'super';

Listar usuários
\du

Sair do psql
\q

Logar na console como super

psql -U super -d postgres
\du

create database testes;
\q
```bash
psql -U super testes < /setup.sql
```
psql -U super -d testes

select * from clients;

Agora vou conectar através do adminer.php via web usando o super1, que é um cliente para vários SGBDs, inclusive PostgreSQL:

http://localhost/adminer.php - do desktop

rc-service postgresql restart

System - PostgreSQL
Server - 172.26.0.2
Username - super
Password - super
Banco - testes

## sqlite

cd /

sqlite3 clients.db

select * from clients;

.quit

## maria

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

\q

Criar usuário com privilégios sobre o banco testes

use mysql;
create user 'super'@'%' identified by 'super';
GRANT ALL PRIVILEGES ON *.* TO super@"%" IDENTIFIED BY 'super' WITH GRANT OPTION;
FLUSH PRIVILEGES;

## adminer

Download adminer para /var/www/localhost/htdocs

cd /var/www/localhost/htdocs

wget https://github.com/vrana/adminer/releases/download/v4.7.8/adminer-4.7.8.php

mv adminer-4.7.8.php index.php

Configurar php.ini

nano /etc/php7/php.ini

display_errors = ON

Configurar apache

nano /etc/apache2/httpd.conf

ServerName localhost

Trocar as 3 ocorrências de

AllowOverride None

por

AllowOverride All

rc-service apache2 restart


