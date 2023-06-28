# Container com adminer

- ubuntu (72.9MB)

Diretamente da imagem

Instalados:
- apache2
- php 7.4

A ideia é que o adminer acesse o mysql em outro container.

docker pull ubuntu

docker run -t -d --name adminer ubuntu

docker images - 72.9MB

docker exec -it adminer bash

apt update
apt install -y apache2 libapache2-mod-php7.4 php7.4 php7.4-mysql
a2enmod rewrite

Caso tenha que acessar outros SGBDs diferentes do mysql, precisa instalar as respectivas extensões do PHP

apt install nano

Configurar
php - habilitar error
Apache - ServerName localhost
None por All

service apache2 restart

## Instalar o adminer

apt isntall wget

cd /var/www/html

wget https://github.com/vrana/adminer/releases/download/v4.7.8/adminer-4.7.8.php

mv adminer-4.7.8.php adminer.php (ou outro nome)

chown -R www-data:www-data *

## Acessando o adminer deste container do host

Capturando o IP do container, do terminal do host e não do container (pode acessar de outro terminal)

docker inspect ID | grep IPAddress

http://172.17.0.2/adminer.php

exit

Salvar as alterações em outra images

docker ps

docker commit ID ribafs/adminer

Nossa imagem ficou com 233MB

Enviar para o docker hub

docker login

docker push ribafs/adminer


Run docker stack deploy -c stack.yml adminer (or docker-compose -f stack.yml up), wait for it to initialize completely, and visit http://swarm-ip:8080, http://localhost:8080, or http://host-ip:8080 (as appropriate).

docker run -p 8080:8080 -e ADMINER_DEFAULT_SERVER=mysql adminer

Supported Drivers

While Adminer supports a wide range of database drivers this image only supports the following out of the box:

    MySQL
    PostgreSQL
    SQLite
    SimpleDB
    Elasticsearch

To add support for the other drivers you will need to install the following PHP extensions on top of this image:

    pdo_dblib (MS SQL)
    oci8 (Oracle)
    interbase (Firebird)
    mongodb (MongoDB)

