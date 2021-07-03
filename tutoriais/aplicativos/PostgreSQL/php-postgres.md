## html/index.php

```php
<?php

phpinfo();
```

## docker/Dockerfile

```dockerfile
FROM php:7-apache

RUN set -x && \
  apt-get -y update && \
  apt-get install -y libicu-dev postgresql-server-dev-9.4 && \
  NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
  docker-php-ext-install -j${NPROC} intl && \
  docker-php-ext-install -j${NPROC} pdo_pgsql && \
  docker-php-ext-install -j${NPROC} pdo_mysql && \
  rm -rf /tmp/pear
```

## docker-compose.yml

```yml
version: '3.1'
services:
  web:
    build:
      context: ./docker
    volumes:
      - ./html:/var/www/html
    ports:
      - "8080:80"
    depends_on:
      - db
    tty: true
    stdin_open: true

  db:
    image: postgres:9.6.1
    ports:
      - "5433:5432"
    environment:
      POSTGRES_PASSWORD: dbpass
      POSTGRES_DB: docker_test
```