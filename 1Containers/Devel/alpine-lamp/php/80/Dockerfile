FROM alpine:3.15 as lampp-img
LABEL maintainer="Ribamar FS <ribafs@gmail.com>"
CMD ["/bin/sh"]
VOLUME [ "/sys/fs/cgroup" ]

RUN apk update && apk add util-linux openrc
RUN apk add --no-cache apache2 nano
RUN apk add mariadb mariadb-client mariadb-openrc

RUN rc-update add apache2 default\
  && mkdir /run/openrc\
  && touch /run/openrc/softlevel  
RUN rc-update add mariadb default

RUN apk add --no-cache php8 php8-apache2 \
    php8 \
    php8-common \
    php8-fpm \
    php8-pdo \
    php8-opcache \
    php8-zip \
    php8-phar \
    php8-bcmath \
    php8-iconv \
    php8-cli \
    php8-curl \
    php8-openssl \
    php8-mbstring \
    php8-tokenizer \
    php8-fileinfo \
    php8-json \
    php8-xml \
    php8-xsl \
    php8-xdebug \
    php8-gd \
    php-pear \
    php8-pecl-apcu \
    php8-pdo_mysql \
    php8-sqlite3 \
    php8-tokenizer \
    php8-pecl-redis

RUN apk add curl

# Installing composer
RUN apk update
RUN apk add --upgrade composer

# No docker-compose.yml montar um volume maria:/var/lib/mysql
ADD maria/ /var/www/localhost/htdocs/
ADD web/ /var/www/localhost/htdocs/
RUN rm /var/www/localhost/htdocs/index.html

WORKDIR /var/www/localhost/htdocs/

COPY entrypoint.sh /usr/local/bin/
RUN chmod u+x,g+x /usr/local/bin/entrypoint.sh\
  && ln -s /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Add apache to run and configure
RUN sed -i "s/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/" /etc/apache2/httpd.conf \
    && sed -i "s/#LoadModule\ session_module/LoadModule\ session_module/" /etc/apache2/httpd.conf \
    && sed -i "s/#LoadModule\ session_cookie_module/LoadModule\ session_cookie_module/" /etc/apache2/httpd.conf \
    && sed -i "s/#LoadModule\ session_crypto_module/LoadModule\ session_crypto_module/" /etc/apache2/httpd.conf \
    && sed -i "s/#LoadModule\ deflate_module/LoadModule\ deflate_module/" /etc/apache2/httpd.conf \
    && sed -i "s/# Example:/ServerName\ localhost/" /etc/apache2/httpd.conf \
    && sed -i "s/AllowOverride\ None/AllowOverride\ All/" /etc/apache2/httpd.conf

EXPOSE 80
EXPOSE 3306
