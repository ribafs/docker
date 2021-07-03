# ribafs/apache-php

ribafs/apache-php - https://hub.docker.com/repository/docker/ribafs/apache-php:alpine

- Imagem oficial alpine
- Apache 2 com mod_rewrite
- PHP 7.3.25 e extenções

## Estrutura

html
    index.php
Dockerfile
docker-compose.yml
entrypoint.sh

## Executar

docker-compose down -v

docker-compose up -d

## Criar container

docker images
testes_web   latest    b2dc13ac6d6e   4 minutes ago   5.58MB

docker run -dt -p 8888:80 testes_web

## Acessar o shell

docker ps

docker exec -it IDContainer sh

# Instalação do Apache e PHP

cat > /etc/apk/repositories << EOF
http://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/main
http://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/community
EOF

apk update

Adicionar os pacotes principais

export phpverx=$(alpinever=$(cat /etc/alpine-release|cut -d '.' -f1);[ $alpinever -ge 9 ] && echo  7|| echo 5)

apk add composer curl nano

Apache e PHP

Pesquisar as extensões para PHP disponíveis

apk search -v 'php7*' | less

apk add apache2 php7-apache2 php7 php7-pdo_mysql php7-curl php7-xml php7-xdebug php7-intl

Configurações feitas

nano /etc/php7/php.ini

- display_errors = On

nano /etc/apache2/httpd.conf

- ServerName localhost

Descomentar a linha

LoadModule rewrite_module modules/mod_rewrite.so

- Trocar os AllowOverride None por AllowOverride All

Instalar OpenRC

apk add openrc --no-cache

Iniciar apache

rc-service apache2 status

Deixar apache no boot

rc-update add apache2

ls /var/www/localhost/htdocs

nano /var/www/localhost/htdocs/index.php

<?php
phpinfo();

rc-service apache2 restart

ifconfig - 172.17.0.2

Acessar o index.php

curl -I http://localhost

http://172.17.0.2

## Alterar no

nano /usr/local/bin/perms

chmod +x /usr/local/bin/perms

Executar

perms

## Varrer apenas a pasta /var/www/html/teste

perms teste


Tamanho com ubuntu era de 208,7 MB


exit

## Salvar uma cópia da imagem atual

docker ps -ql

197387f1b436

docker commit 197387f1b436 ribafs/apache-php:alpine

docker images

Ficou com 208,7 MB

## Enviar para o docker hub

docker login

docker push ribafs/apache-php:alpine


