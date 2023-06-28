FROM debian:unstable-slim as web-img

LABEL maintainer="Ribamar FS <ribafs@gmail.com>"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apache2 nano

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

ADD web/ /var/www/html/
RUN rm /var/www/html/index.html

WORKDIR /var/www/html/

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# install apache to run and configure
RUN sed -i "s/AllowOverride\ None/AllowOverride\ All/" /etc/apache2/apache2.conf

EXPOSE 80

