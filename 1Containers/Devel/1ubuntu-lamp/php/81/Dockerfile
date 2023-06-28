FROM ubuntu:22.04 as web-img

LABEL maintainer="Ribamar FS <ribafs@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apache2 nano mysql-server

RUN apt-get install -y php8.1 libapache2-mod-php \
    php8.1 \
    php8.1-common \
    composer \
    php8.1-fpm \
    php8.1-cli \
    php8.1-curl \
    php-json \
    php8.1-xsl \
    php8.1-xdebug \
    php8.1-gd \
    php-pear \
    php8.1-mysql \
    php8.1-sqlite

RUN apt-get install -y curl

ADD web/ /var/www/html/
RUN rm /var/www/html/index.html
ADD mysql/ /var/www/html/

WORKDIR /var/www/html/

COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

COPY perms /usr/local/bin/perms
RUN chmod +x /usr/local/bin/perms

# install apache to run and configure
RUN sed -i "s/AllowOverride\ None/AllowOverride\ All/" /etc/apache2/apache2.conf
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

EXPOSE 80
EXPOSE 3306

