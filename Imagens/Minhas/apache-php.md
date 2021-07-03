# ribafs/apache-php:versao1

ribafs/apache-php - https://hub.docker.com/repository/docker/ribafs/apache-php

- Imagem oficial ubuntu
- Apache 2 com mod_rewrite
- PHP 7.4 e extenções

## Baixando, criando o container e executando

As demais serão isntaladas via Dockerfile na criação dos containers (anotar no docker hub as extensões e o Dokerfile sugerido)

docker run -it ubuntu bash

exit

## Acessar usando docker exec

docker pd -a

docker start IDCont

docker exec -it IDCont bash

## Instalar Apache e PHP

apt update

apt upgrade

apt install -y nano apache2 libapache2-mod-php7.4 composer curl 
apt install -y php7.4 php7.4-mysql php7.4-pdo-mysql php7.4-curl php7.4-xml php-xdebug php7.4-intl

Configurar

php.ini - display_errors = On

apache2.conf:
- ServerName localhost
- Trocar None por All

service apache2 restart

exit

## Salvar uma cópia da imagem atual

docker ps -ql

197387f1b436

docker commit 197387f1b436 ribafs/apache-php:versao1

docker images

Ficou com 208,7 MB

## Enviar para o docker hub

docker login

docker push ribafs/apache-php:versao1

## Ajustar as permissões do /var/www/data

## Criar usuário

adduser ribafs

## Adicionar user para o www-data

adduser ribafs www-data

## Alterar no

nano /usr/local/bin/perms

chmod +x /usr/local/bin/perms

Executar

perms

## Varrer apenas a pasta /var/www/html/teste

perms teste


