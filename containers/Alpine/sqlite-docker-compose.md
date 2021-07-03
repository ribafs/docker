# Container com Sqlite3

sqlite com alpine usando docker-compose.yml e Dockerfile

## Estrutura

raiz

    docker-compose.yml
    Dockerfile
    db
        setup.sql

## Criar o dockerfile no diretório atual

Dockerfile

FROM alpine

RUN apk sqlite

COPY db/setup.sql /

## Criar o docker-compose.yml no diretório atual

version: "3.6" 

services:
    sqlite:

      container_name: sqlite-container

      restart: always

      build:
        context: .
        dockerfile: ./Dockerfile

      volumes:
        - ./db:/var/lib/sqlite

      tty: true

volumes:
  db:

## Executar

docker-compose down -v
docker-compose up -d

docker ps
CONTAINER ID   IMAGE           COMMAND     CREATED         STATUS         PORTS     NAMES
44e0b93d00eb   testes_sqlite   "sqlite3"   3 seconds ago   Up 2 seconds             sqlite-container

## Acessar o shell sh

docker exec -it sqlite-container sh

## Importar o script setup.sql enviado para o /

Após executar o comando anterior estamos no raiz do alpine (/ #)

Estando no raiz / execute:
```bash
sqlite3 testes < setup.sql
```
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

