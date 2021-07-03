# Imagem oficial php

https://hub.docker.com/_/php

docker pull php

SO - Debian 10

Tamanho - 417MB

Iniciar container

docker run --name php -d php:apache

docker ps -q

Acessar

docker exec -it ID bash

Testar

service apache2 status

Apache já vem rodando

Quando tento instalar alguma extensão do PHP ele diz que não está disponível.
Então usarei esta ribafs/apache-php:versao1, que é baseada no ubuntu e não tem este problema.

Dockerfile

FROM php:7.4-cli
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
CMD [ "php", "./your-script.php" ]

Then, run the commands to build and run the Docker image:

$ docker build -t my-php-app .
$ docker run -it --rm --name my-running-app my-php-app

Run a single PHP script

For many simple, single file projects, you may find it inconvenient to write a complete Dockerfile. In such cases, you can run a PHP script by using the PHP Docker image directly:

$ docker run -it --rm --name my-running-script -v "$PWD":/usr/src/myapp -w /usr/src/myapp php:7.4-cli php your-script.php

Instalar mais extensões PHP

FROM php:7.4-cli
RUN docker-php-source extract \
    # do important things \
    && docker-php-source delete

Outras

FROM php:5.6-cli
RUN curl -fsSL 'https://xcache.lighttpd.net/pub/Releases/3.2.0/xcache-3.2.0.tar.gz' -o xcache.tar.gz \
    && mkdir -p xcache \
    && tar -xf xcache.tar.gz -C xcache --strip-components=1 \
    && rm xcache.tar.gz \
    && ( \
        cd xcache \
        && phpize \
        && ./configure --enable-xcache \
        && make -j "$(nproc)" \
        && make install \
    ) \
    && rm -r xcache \
    && docker-php-ext-enable xcache

FROM php:5.6-cli
RUN curl -fsSL 'https://xcache.lighttpd.net/pub/Releases/3.2.0/xcache-3.2.0.tar.gz' -o xcache.tar.gz \
    && mkdir -p /tmp/xcache \
    && tar -xf xcache.tar.gz -C /tmp/xcache --strip-components=1 \
    && rm xcache.tar.gz \
    && docker-php-ext-configure /tmp/xcache --enable-xcache \
    && docker-php-ext-install /tmp/xcache \
    && rm -r /tmp/xcache


