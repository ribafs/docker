# Container com adminer

Com docker-compose.yml e Dockerfile

Dockerfile

FROM ubuntu

RUN apt-get update && apt install -y apache2 libapache2-mod-php7.4 php7.4 php7.4-mysql

A ideia é que o adminer acesse o mysql em outro container.

docker build --tag adminer .

Imagem com 124MB

docker run -t -d --name adminer ubuntu

docker exec -it adminer bash

apt update
apt install -y nano wget
apt install -y apache2 libapache2-mod-php7.4 php7.4 php7.4-mysql
a2enmod rewrite

Caso tenha que acessar outros SGBDs diferentes do mysql, precisa instalar as respectivas extensões do PHP

Configurar
php - habilitar error
Apache - ServerName localhost
None por All

service apache2 restart

## Instalar o adminer

cd /var/www/html

wget https://github.com/vrana/adminer/releases/download/v4.7.8/adminer-4.7.8.php

mv adminer-4.7.8.php adminer.php

chown -R www-data:www-data *

ls -la

## Acessando o adminer deste container do host

Capturando o IP do container, do terminal do host e não do container (pode acessar de outro terminal)

docker inspect ID | grep IPAddress

Acessar do desktop

http://172.17.0.2/adminer.php

exit

Salvar as alterações em outra images

docker ps

docker commit ID ribafs/adminer (233MB)

Enviar para o docker hub

docker login

docker push ribafs/adminer

## Salvar as alterações em outra images

docker ps

docker commit ID ribafs/adminer

Nossa imagem ficou com 233MB

## Enviar para o docker hub

docker login

docker push ribafs/adminer

