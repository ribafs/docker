# Tutorial Básico sobre Docker - 2

## Criar um Dockerfile

https://docs.docker.com/engine/reference/builder/

A criação de um Dockerfile facilita a criação customizada de imagens, pois existem diversos recursos neste arquivo.

nano Dockerfile

É uma boa prática comentar o Dockerfile sempe que considerar importante

Veja o exemplo de Dockerfile disponível neste diretório

## Criar a imagem partindo do Dockerfile

Estando no mesmo diretório do Dockerfile (observe o ponto ao final)

docker build -t lamp-img .

Nossa imagem ficou com 309MB

docker images

REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
lamp-img     latest    b7fd16314f49   9 seconds ago   309MB

Este Dockerfile usa a imagem ubuntu

## Criar o container para a imagem criada, dando um nome ao container

docker run -dt --name lamp-cont lamp-img

## Acessar o shell do container criado

docker exec -it lamp-cont bash

Nosso container está com suporte a UTF-8. O comportamento default das imagens docker é não suporte a UTF-8.

Testando se o apache está rodando

service apache2 status

running

ls /var/www/html

Nosso index.php está lá

ls -la /var/www/html

Veja que o www-data é dono dos arquivos.

ls /setup.sql

## Configurar php

nano /etc/php/7.4/apache2/php.ini

display_errors = On

## Configurar apache

nano /etc/apache2/apache2.conf

ServerName localhost

AllowOverride All nas 3 ocorrências

service apache2 restart

## Acessar pelo desktop

Verificar o IP do container, do desktop, de fora do container (pode ser de outro terminal)

docker ps

docker inspect IDContainer | grep IPAddress

http://IP/

## Testando MySQK

service mysql start

mysql -uroot

create database testes;
\q

mysql -uroot testes < /setup.sql

mysql -uroot

use testes

select * from clients;

## Ajustar as permissões do /var/www/data

## Criar usuário

adduser ribafs

## Adicionar user para o www-data

adduser ribafs www-data

## Ajustar permissões no /var/www/html

chmod +x /usr/local/bin/perms

Varrer toda a pasta /var/www/html

perms

## Varrer apenas a pasta /var/www/html/teste

perms teste

Prontinho. Nosso container docker com o LAMP completo está pronto.

## Salvar as alterações noutra imagem

docker ps -ql

197387f1b436

docker commit 197387f1b436 ribafs/lamp

docker images

Ficou com 694 MB

## Enviar para o docker hub

docker login

docker push ribafs/lamp


