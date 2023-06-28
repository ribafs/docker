FROM ubuntu:20.04 as web-img

LABEL maintainer="Ribamar FS <ribafs@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apache2 nano
RUN apt-get update && apt-get install -y mysql-server postgresql-client postgresql
RUN apt-get install -y curl

RUN apt-get install -y php7.4 libapache2-mod-php \
    php7.4 \
    php7.4-common \
    php7.4-fpm \
    php7.4-cli \
    php7.4-curl \
    php7.4-json \
    php7.4-xsl \
    php7.4-xdebug \
    php7.4-gd \
    php-pear \
    php7.4-mysql \
    php7.4-pgsql \
    php7.4-sqlite

RUN apt-get install -y curl

ADD web/ /var/www/html/
RUN rm /var/www/html/index.html
ADD pg/ /
ADD mysql/ /

WORKDIR /var/www/html/

COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# install apache to run and configure
RUN sed -i "s/# Example:/ServerName\ localhost/" /etc/apache2/apache2.conf \
    && sed -i "s/AllowOverride\ None/AllowOverride\ All/" /etc/apache2/apache2.conf

EXPOSE 80
EXPOSE 3306
EXPOSE 5432
