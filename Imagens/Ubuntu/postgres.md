# Imagem oficial do postgresql

https://hub.docker.com/_/postgres

SO - Debian 10

Tamanho - 314MB

Baixar

docker pull postgres

Iniciar

docker run --name postgres -e POSTGRES_PASSWORD=postgres -d postgres:latest

docker ps -q

Acessar

docker exec -it ID bash

su - postgres

psql

Versão 13.1

Sem problema

docker run -it --rm --network some-network postgres psql -h some-postgres -U postgres


# Use postgres/example user/password credentials
version: '3.1'

services:

  db:
    image: postgres
    restart: always
    environment:
      POSTGRES_PASSWORD: example

  adminer:
    image: adminer
    restart: always
    ports:
      - 8080:8080

POSTGRES_PASSWORD
POSTGRES_USER
POSTGRES_DB
POSTGRES_INITDB_ARGS
POSTGRES_INITDB_WALDIR
POSTGRES_HOST_AUTH_METHOD

docker run -d \
    --name some-postgres \
    -e POSTGRES_PASSWORD=mysecretpassword \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v /custom/mount:/var/lib/postgresql/data \
    postgres

ocker run --name some-postgres -e POSTGRES_PASSWORD_FILE=/run/secrets/postgres-passwd -d postgres

Currently, this is only supported for POSTGRES_INITDB_ARGS, POSTGRES_PASSWORD, POSTGRES_USER, and POSTGRES_DB.

Initialization scripts

If you would like to do additional initialization in an image derived from this one, add one or more *.sql, *.sql.gz, or *.sh scripts under /docker-entrypoint-initdb.d (creating the directory if necessary). After the entrypoint calls initdb to create the default postgres user and database, it will run any *.sql files, run any executable *.sh scripts, and source any non-executable *.sh scripts found in that directory to do further initialization before starting the service.

Warning: scripts in /docker-entrypoint-initdb.d are only run if you start the container with a data directory that is empty; any pre-existing database will be left untouched on container startup. One common problem is that if one of your /docker-entrypoint-initdb.d scripts fails (which will cause the entrypoint script to exit) and your orchestrator restarts the container with the already initialized data directory, it will not continue on with your scripts.

For example, to add an additional user and database, add the following to /docker-entrypoint-initdb.d/init-user-db.sh:

#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER docker;
    CREATE DATABASE docker;
    GRANT ALL PRIVILEGES ON DATABASE docker TO docker;
EOSQL

These initialization files will be executed in sorted name order as defined by the current locale, which defaults to en_US.utf8. Any *.sql files will be executed by POSTGRES_USER, which defaults to the postgres superuser. It is recommended that any psql commands that are run inside of a *.sh script be executed as POSTGRES_USER by using the --username "$POSTGRES_USER" flag. This user will be able to connect without a password due to the presence of trust authentication for Unix socket connections made inside the container.

Additionally, as of docker-library/postgres#253, these initialization scripts are run as the postgres user (or as the "semi-arbitrary user" specified with the --user flag to docker run; see the section titled "Arbitrary --user Notes" for more details). Also, as of docker-library/postgres#440, the temporary daemon started for these initialization scripts listens only on the Unix socket, so any psql usage should drop the hostname portion (see docker-library/postgres#474 (comment) for example).

$ # get the default config
$ docker run -i --rm postgres cat /usr/share/postgresql/postgresql.conf.sample > my-postgres.conf

$ # customize the config

$ # run postgres with custom config
$ docker run -d --name some-postgres -v "$PWD/my-postgres.conf":/etc/postgresql/postgresql.conf -e POSTGRES_PASSWORD=mysecretpassword postgres -c 'config_file=/etc/postgresql/postgresql.conf'

docker run -d --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword postgres -c shared_buffers=256MB -c max_connections=200

FROM postgres:9.4
RUN localedef -i de_DE -c -f UTF-8 -A /usr/share/locale/locale.alias de_DE.UTF-8
ENV LANG de_DE.utf8

CAVEAR

    Create a data directory on a suitable volume on your host system, e.g. /my/own/datadir.

    Start your postgres container like this:

    $ docker run --name some-postgres -v /my/own/datadir:/var/lib/postgresql/data -e POSTGRES_PASSWORD=mysecretpassword -d postgres:tag



