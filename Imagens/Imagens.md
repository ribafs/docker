# Imagens do docker

fedora - 60MB

debian

FROM debian:stable-slim
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
CMD ["bash"]


debian:stable - 48MB

centos

ubuntu, ribafs/ubuntu e ribafs/lamp

httpd

postgres - ribafs/postgres

php, ribafs/apache-php

mariadb, ribafs/mariadb

mysql

