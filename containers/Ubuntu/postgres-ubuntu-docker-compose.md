# Criando container com PostgreSQL

Usando a imagem ribafs/postgres

Com docker-compose.yml e Dockerfile

Estrutura

raiz
    docker-compose.yml
    Dockerfile
    db
        setup.sql

Estando no mesmo diretório do docker-compose.yml executar

docker-compose down -v

docker-compose up -d

docker images

ribafs/postgres   latest    064e4d21e199   13 minutes ago   376MB

docker ps

8888ea797959   testes_pg   "bash"    About a minute ago   Up About a minute   0.0.0.0:6432->5432/tcp   pg-container

docker exec -it pg-container bash

cat /etc/issue - Ubuntu 20.04

service postgresql start

nano

su - postgres

psql -d postgres < /setup.sql

psql

\d

\d clients

select * from clients;

\q


