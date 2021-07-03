# Imagem oficial mysql

https://hub.docker.com/_/mysql

Debian 10

Baixar

docker pull mysql:latest

Iniciar

docker run --name mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:latest

docker exec -it mysql bash

service mysql status ou start

mysql: unrecognized service

Este erro aparece nas versões: latest, 8, 

5.7 - funcionou


## Use root/example as user/password credentials

version: '3.1'

services:

  db:
    image: mysql
    command: --default-authentication-plugin=mysql_native_password
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: example

  adminer:
    image: adminer
    restart: always
    ports:
      - 8080:8080

ocker logs some-mysql

MYSQL_ALLOW_EMPTY_PASSWORD

    Create a data directory on a suitable volume on your host system, e.g. /my/own/datadir.

    Start your mysql container like this:

    $ docker run --name some-mysql -v /my/own/datadir:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag


Creating database dumps

Most of the normal tools will work, although their usage might be a little convoluted in some cases to ensure they have access to the mysqld server. A simple way to ensure this is to use docker exec and run the tool from the same container, similar to the following:

$ docker exec some-mysql sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > /some/path/on/your/host/all-databases.sql

Restoring data from dump files

For restoring data. You can use docker exec command with -i flag, similar to the following:

$ docker exec -i some-mysql sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"' < /some/path/on/your/host/all-databases.sql


