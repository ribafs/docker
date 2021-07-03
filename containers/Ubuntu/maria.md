# Meu container preferido para mariadb

Usar a image oficial mariadb:10.3

Criar assim

docker pull mariadb:10.3 - 388MB

ou

## docker-compose.yml

version: '3.1'

services:

    db:
      container_name: maria

      command: --default-authentication-plugin=mysql_native_password

      restart: always

      build:
        context: ./db
        dockerfile: ./Dockerfile

      volumes:
        - ./db:/var/lib/mysql

      ports:
        - "3333:3333"

    adminer:
      image: adminer
      restart: always
      ports:
        - 8888:8888

'
