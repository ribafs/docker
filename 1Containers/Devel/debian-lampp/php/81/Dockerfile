FROM debian:unstable-slim as lampp-img

LABEL maintainer="Ribamar FS <ribafs@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apache2 nano

RUN mkdir -p /usr/share/man/man1
RUN mkdir -p /usr/share/man/man7
RUN apt-get update
RUN apt-get install -y postgresql-client-14
RUN apt-get install -y postgresql-14

RUN apt-get update
RUN apt-get install -y software-properties-common dirmngr
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -yq install mariadb-server

RUN apt-get install -y php8.1 libapache2-mod-php8.1 \
    php8.1 \
    php8.1-common \
    php8.1-fpm \
    php8.1-cli \
    php8.1-curl \
    php-json \
    php8.1-xsl \
    php8.1-xdebug \
    php8.1-gd \
    php-pear \
    php8.1-mysql \
    php8.1-pgsql \
    php8.1-sqlite

RUN apt-get install -y curl

# No docker-compose.yml montar um volume mysql:/var/lib/mysql
ADD mysql/ /var/www/html/
ADD web/ /var/www/html/
ADD pg/ /var/www/html/
RUN rm /var/www/html/index.html

WORKDIR /var/www/html/

COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN echo "172.17.0.2    postgres" >> /etc/hosts
RUN echo "172.17.0.4    maria" >> /etc/hosts

# install apache to run and configure
RUN sed -i "s/AllowOverride\ None/AllowOverride\ All/" /etc/apache2/apache2.conf

EXPOSE 80
EXPOSE 3306
EXPOSE 5432
