# Container com PostgreSQL

De um Dockerfile da imagem ocifial

Dockerfile e docker-entrypoint.sh tanto do postgres quando do alpine vieram do GH da imagem oficial

docker build --tag pg-image .

Imagem baixada com docker pull tem 314MB

Imagem baixada assim ficou com 

docker run -t -d --name pg-container pg-image

docker exec -it pg-container sh

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

