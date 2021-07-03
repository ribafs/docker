# Container com PostgreSQL

PostgreSQL com alpine usando docker-compose.yml e Dockerfile

## Estrutura

raiz

    docker-compose.yml
    Dockerfile
    db
        setup.sql

## Criar o dockerfile no diretório atual

Dockerfile

Este arquivo veio do GitHub, do site da imagem oficial do postgres com alpine

https://github.com/docker-library/postgres/blob/b9c080857b880202ebd23c59d33fe86d7a70fea3/13/alpine/Dockerfile

COPY db/setup.sql /


## Criar o docker-compose.yml no diretório atual

version: "3.6" 

services:
    pg:

      container_name: pg-container

      restart: always

      build:
        context: .
        dockerfile: ./Dockerfile

      ports:
        - "6432:5432"

      volumes:
        - pgdata:/var/lib/postgresql/data

      networks:
        - db

      command: 'sh'

      tty: true

volumes:
  pgdata: {}

networks:
  db:
    driver: bridge


## Executar

docker-compose down -v
docker-compose up -d

docker images

REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
testes_pg    latest    5fd0878ba0d9   10 seconds ago   145MB
alpine       latest    389fef711851   35 hours ago     5.58MB

Nossa imagem com o postgresql ficou com 145MB

## Acessar o shell sh

docker exec -it pg-container sh

Instalar o openrc

apk add openrc --no-cache

Iniciar o postgres

rc-service postgresql start

## Importar o script setup.sql enviado para o /

Após executar o comando anterior estamos no raiz do alpine (/ #)

Estando no raiz / execute:

sqlite3 testes < setup.sql

sqlite3 testes

select * from clients;

## Criar um banco teste

Usando o sqlite3 instalado na criação do container

sqlite3 teste

## Criar tabela

create table clients (id integer primary key autoincrement, name varchar(50), email varchar(50));

## Inserir registros

insert into clients(name, email) values ('Ribamar FS', 'ribafs@gmail.com'), ('Elias EF', 'elias@elias.org'), ('Tiago EF', 'tiago@tiago.net'), ('Fátima EF', 'fatima@fatima.org'), ('Rex EF', 'rex@elias.org') ;

## Consultar os registros

select * from clients;

## Documentação 

https://wiki.alpinelinux.org/wiki

## Sair

.quit

## Voltar ao banco teste

sqlite teste

## Obtendo ajuda

.help

## Também podemos criar scripts no nosso host/desktop, copiar e colar no shell do alpine.

## Salvar as alterações em outra imagem

docker commit sqlite-container ribafs/sqlite

Nossa imagem ficou com 9.34MB

## Enviar para o docker hub

docker login

docker push ribafs/sqlite

