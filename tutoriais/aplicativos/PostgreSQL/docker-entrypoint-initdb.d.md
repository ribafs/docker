version: "3.3"
services:
  db:
    build:
      context: ./Docker
      dockerfile: db.Dockerfile
    volumes:
      - ./var/pgdata:/var/lib/postgresql/data
    ports:
      - "5432:5432"

File: Docker/init.sql

CREATE USER myUser;

CREATE DATABASE myApp_dev;
GRANT ALL PRIVILEGES ON DATABASE myApp_dev TO myUser;

CREATE DATABASE myApp_test;
GRANT ALL PRIVILEGES ON DATABASE myApp_test TO myUser;

File: Docker/db.Dockerfile

FROM postgres:11.5-alpine
COPY init.sql /docker-entrypoint-initdb.d/

Composing and starting services:

docker-compose -f docker-compose.yml up --no-start
docker-compose -f docker-compose.yml start
----------



With docker compose there's a simple alternative (no need to create a Dockerfile). Just create a init-database.sh:

#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER docker;
    CREATE DATABASE my_project_development;
    GRANT ALL PRIVILEGES ON DATABASE my_project_development TO docker;
    CREATE DATABASE my_project_test;
    GRANT ALL PRIVILEGES ON DATABASE my_project_test TO docker;
EOSQL

And reference it in the volumes section:

version: '3.4'

services:
  postgres:
    image: postgres
    restart: unless-stopped
    volumes:
      - postgres:/var/lib/postgresql/data
      - ./init-database.sh:/docker-entrypoint-initdb.d/init-database.sh
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres
    ports:
      - 5432:5432

volumes:
  postgres:

-------------


EDIT - since Jul 23, 2015

The official postgres docker image will run .sql scripts found in the /docker-entrypoint-initdb.d/ folder.

So all you need is to create the following sql script:

init.sql

CREATE USER docker;
CREATE DATABASE docker;
GRANT ALL PRIVILEGES ON DATABASE docker TO docker;

and add it in your Dockerfile:

Dockerfile

FROM library/postgres
COPY init.sql /docker-entrypoint-initdb.d/

But since July 8th, 2015, if all you need is to create a user and database, it is easier to just make use to the POSTGRES_USER, POSTGRES_PASSWORD and POSTGRES_DB environment variables:

docker run -e POSTGRES_USER=docker -e POSTGRES_PASSWORD=docker -e POSTGRES_DB=docker library/postgres

or with a Dockerfile:

FROM library/postgres
ENV POSTGRES_USER docker
ENV POSTGRES_PASSWORD docker
ENV POSTGRES_DB docker

