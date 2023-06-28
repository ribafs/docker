FROM ubuntu:14.04 as web-img

LABEL maintainer="Ribamar FS <ribafs@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apache2 nano

RUN apt-get install -y php5 libapache2-mod-php5 \
    php5 \
    php5-common \
    php5-fpm \
    php5-cli \
    php5-curl \
    php5-json \
    php5-xsl \
    php5-xdebug \
    php5-gd \
    php-pear \
    php5-mysql \
    php5-pgsql \
    php5-sqlite

RUN apt-get install -y curl

ADD web/ /var/www/html/
RUN rm /var/www/html/index.html

RUN echo "172.17.0.2  postgres" >> /etc/hosts
RUN echo "172.17.0.4  maria" >> /etc/hosts

WORKDIR /var/www/html/

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN sed -i "s/AllowOverride\ None/AllowOverride\ All/" /etc/apache2/apache2.conf

EXPOSE 80

