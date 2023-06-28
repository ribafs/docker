FROM alpine:3.15 as lampp-img

LABEL maintainer="Ribamar FS <ribafs@gmail.com>"
CMD ["/bin/sh"]
VOLUME [ "/sys/fs/cgroup" ]

RUN apk add --no-cache php7 php7-apache2 \
    php7 \
    php7-common \
    php7-zip \
    php7-cli \
    php7-json \
    php7-xsl \
    php7-gd \
    php7-pdo_mysql

RUN apk add curl

# Installing composer
RUN apk update
RUN apk add --upgrade composer

RUN rm /usr/bin/php
RUN ln -s /usr/bin/php7 /usr/bin/php

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
