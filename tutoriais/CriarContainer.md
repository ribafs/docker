# Criar container docker

docker-compose up -d

docker-compose run web bash (web é o service do docker-compose.yml)

## Criar container partindo de imagem

docker iamges

docker create -it ribafs/mariadb bash

Iniciar container criado
docker ps
docker start ID 
docker exec -it ID bash

## Importar script sql na criação do container


### Usando docker-compose.yml

version: '3'

services:
  mysql:
    image: mariadb:10.3
    container_name: mariadb
    volumes:
      - container-volume:/var/lib/mysql
      - ./dump.sql:/docker-entrypoint-initdb.d/dump.sql
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: name_db
    ports:
      - "3306:3306"

volumes:
  container-volume:

ou

Mount your sql-dump under/docker-entrypoint-initdb.d/yourdump.sql utilizing a volume mount

mysql:
  image: mysql:latest
  container_name: mysql-container
  ports:
    - 3306:3306
  volumes:
    - ./dump.sql:/docker-entrypoint-initdb.d/dump.sql
  environment:
    MYSQL_ROOT_PASSWORD: secret
    MYSQL_DATABASE: name_db
    MYSQL_USER: user
    MYSQL_PASSWORD: password

docker-compose up -d
