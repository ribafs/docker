# sqlite sob alpine

Ficou com um tamanhp final de 9.35MB

## Sugestão de instalação

## Estrutura

raiz
    db
        setup.sql
    docker-compose.yml
    Dockerfile

## Download

https://github.com/ribafsdocker/sqlite

Descompacte e acesse a pasta

Estando na pasta execute

docker-compose down -v

docker-compose up -d

## Acessar o shell

docker exec -it sqlite-container sh

Obs.: precisa ser sh. O alpine não suporte bash

## Importar o script setup.sql

Como na criação do container o script db/setup.sql foi copiado para o raiz

sqlite3 clientes < /setup.sql

sqlite3 clientes

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


