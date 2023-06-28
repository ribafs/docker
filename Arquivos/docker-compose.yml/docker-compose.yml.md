# docker-compose.yml

Existem vários benefícios em usar o docker-compose.yml para criar vários containers de aplicativos.

# docker compose

docker-compose exec php chown -R $USER:www-data /var/www/html

php é o container no docker-compose.yml

## Criar container

docker-compose down -v

docker-compose up -d

## Exemplo LAMP

version: "3.6" 

services:
    postgres:
      container_name: postgres-container
      restart: always
      build:
        context: .
        dockerfile: ./Dockerfile-postgres
      ports:
        - "6432:5432"
      volumes:
        - pgdata:/var/lib/postgresql/data
      tty: true
      networks:
      - alpine-net

    maria:
      container_name: maria-container
      restart: always
      build:
        context: .
        dockerfile: Dockerfile-maria
      volumes: 
        - maria:/var/lib/mysql:rw
      ports:
        - "3333:3306"
      environment:
        TZ: "America/Fortaleza"
        MYSQL_DATABASE: "testes"
        MYSQL_ROOT_PASSWORD: "root"
      tty: true
      networks:
      - alpine-net

    web:
      container_name: web-container
      build:
        context: .
        dockerfile: Dockerfile-web
      environment:
        APACHE_RUN_USER: www-data
        APACHE_RUN_GROUP: www-data
        WEB_DOCUMENT_ROOT: /var/www/html
        VIRTUAL_HOST: sub.site.com
      volumes:
        - ./web:/var/www/html
      ports:
        - "8888:80"
        - "4443:443"
      networks:
      - alpine-net

    sqlite:
      container_name: sqlite-container
      restart: always
      build:
        context: .
        dockerfile: ./Dockerfile-sqlite
      volumes:
        - ./sqlite:/var/lib/sqlite
      tty: true
      networks:
      - alpine-net

    adminer:
      container_name: adminer-container
      build:
        context: .
        dockerfile: Dockerfile-adminer
      volumes:
        - ./adminer:/var/www/html
      networks:
      - alpine-net

networks:
  alpine-net:
    driver: bridge

volumes:
  pgdata: {}
  maria:
  web:
  sqlite:
  adminer:

