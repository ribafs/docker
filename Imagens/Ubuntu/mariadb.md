# Imagem oficial mariadb

https://hub.docker.com/_/mariadb

SO - Ubuntu 20.04

Tamanho - 388MB

Baixar

docker pull mariadb

Iniciar

docker run --name maria -e MYSQL_ROOT_PASSWORD=root -d mariadb:10.3

docker ps -q

Acessar

docker exec -it ID bash

Testar

mysql -uroot -proot

As versões abaixo ńão fncionaram:

- latest
- 10.5
- 10.4

Acusaram o erro:

mysql: unrecognized service

Importante:

O container já inicia com o mysql startado

docker-compose.yml

version: '3.1'

services:

  db:
    image: mariadb
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: example

  adminer:
    image: adminer
    restart: always
    ports:
      - 8080:8080

docker logs some-mariadb

Environment Variables

MYSQL_ALLOW_EMPTY_PASSWORD

MYSQL_RANDOM_ROOT_PASSWORD

MYSQL_INITDB_SKIP_TZINFO


Restaurando dados de script sql na criação do container

Devemos estar no mesmo nível do dir db

docker exec -i ID sh -c 'exec mysql -uroot -proot' < db/setup.sql

docker exec -it ID bash

Já inicia com o banco criado e os dados carregados

O script db/setup.sql pode conter qualquer código sql válido: criar banco, criar tabelas, insetir registros, etc.


