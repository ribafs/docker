FROM alpine:3.15 as web-img

LABEL maintainer="Ribamar FS <ribafs@gmail.com>"
CMD ["/bin/sh"]
VOLUME [ "/sys/fs/cgroup" ]

RUN apk update && apk add util-linux openrc
RUN apk add --no-cache apache2 nano

RUN rc-update add apache2 default\
  && mkdir /run/openrc\
  && touch /run/openrc/softlevel  

RUN apk add --no-cache php7-apache2 \
    php7 \
    php7-common \
    php7-fpm \
    php7-pdo \
    php7-opcache \
    php7-zip \
    php7-phar \
    php7-iconv \
    php7-cli \
    php7-curl \
    php7-openssl \
    php7-mbstring \
    php7-tokenizer \
    php7-fileinfo \
    php7-json \
    php7-xml \
    php7-xmlwriter \
    php7-simplexml \
    php7-dom \
    php7-pdo_mysql \
    php7-pdo_pgsql \
    php7-pdo_sqlite \
    php7-tokenizer \
    php7-pecl-redis

RUN rm /usr/bin/php
RUN ln -s /usr/bin/php7 /usr/bin/php
RUN apk add curl

# Installing composer
RUN apk update
RUN apk add --upgrade composer

ADD web/ /var/www/localhost/htdocs/
RUN rm /var/www/localhost/htdocs/index.html

WORKDIR /var/www/localhost/htdocs/

COPY config/web/entrypoint.sh /usr/local/bin/
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

