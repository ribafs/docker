# Imagem oficial do apache

https://hub.docker.com/_/httpd

SO - Debian 10

Tamanho - 138MB

Baixar

docker pull httpd:latest

docker run --name apache -p 8888:8888 -d httpd:latest

docker ps =a

docker exec -it ID bash

service apache2 status

apache2: unrecognized service

Baixar a versão 2.4, problema

2.2 - também problema

Esquece, é melhor usar

- ribafs/apache-php:versao1
- php:apache

Dockerfile

FROM httpd:2.4
COPY ./public-html/ /usr/local/apache2/htdocs/

docker build -t my-apache2 .
$ docker run -dit --name my-running-app -p 8080:80 my-apache2

Configuração

To customize the configuration of the httpd server, first obtain the upstream default configuration from the container:

docker run --rm httpd:2.4 cat /usr/local/apache2/conf/httpd.conf > my-httpd.conf

FROM httpd:2.4
COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf

SSL/HTTPS

If you want to run your web traffic over SSL, the simplest setup is to COPY or mount (-v) your server.crt and server.key into /usr/local/apache2/conf/ and then customize the /usr/local/apache2/conf/httpd.conf by removing the comment symbol from the following lines:

...
#LoadModule socache_shmcb_module modules/mod_socache_shmcb.so
...
#LoadModule ssl_module modules/mod_ssl.so
...
#Include conf/extra/httpd-ssl.conf

RUN sed -i \
        -e 's/^#\(Include .*httpd-ssl.conf\)/\1/' \
        -e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
        conf/httpd.conf


