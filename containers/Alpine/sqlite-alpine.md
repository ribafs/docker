# Container com Sqlite3

sqlite com alpine direto da imagem

## Baixar a imagem oficial alpine

docker pull alpine

## Criar o container

docker run -td --name sqlite alpine

## Acessar o shell sh

docker exec -it sqlite sh

## Instalar o sqlite3

apk add sqlite

## Criar um banco teste

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
