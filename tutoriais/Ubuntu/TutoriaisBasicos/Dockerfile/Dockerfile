# LAMP no ubuntu: Apache, PHP e MySQL
FROM ubuntu

LABEL maintainer="Ribamar FS <ribafs@gmail.com>"

LABEL Exemplo parte do Tutorial Básico sobre Docker
LABEL Em sua versão inicial

USER root

# Desabilitar a interatividade dom o usuário
ARG DEBIAN_FRONTEND=noninteractive

# Instalar pacotes básicos
RUN apt-get update && apt-get install -y nano curl

# Definir o diretório de trabalho do apache
WORKDIR /var/www/html

# Instalar o Apache e o suporte ao PHP no Apache
RUN apt-get install -y apache2 libapache2-mod-php7.4

# Instalar o PHP e algumas extensões importantes
RUN apt-get install -y php7.4 php7.4-mysql php7.4-curl php-pear php7.4-xml php7.4-xsl php-xdebug php7.4-intl
RUN apt-get install -y php7.4-zip php7.4-mbstring

# Instalar mariadb
RUN apt-get install -y mariadb-server

# Habilitar o mbstring
RUN phpenmod mbstring

# Habilitar o suporte para UTF-8
RUN apt-get clean && apt-get update && apt-get install -y locales
RUN locale-gen en_US en_US.UTF-8
RUN echo "export LC_ALL=en_US.UTF-8" >> ~/.bashrc
RUN echo "export LANG=en_US.UTF-8" >> ~/.bashrc
RUN echo "export LANGUAGE=en_US.UTF-8" >> ~/.bashrc
RUN dpkg-reconfigure locales

# Abrir a porta 80 no container
EXPOSE 80

COPY db/setup.sql /
COPY web/index.php /var/www/html
COPY web/perms /usr/local/bin

RUN chown -R www-data:www-data /var/www/html

# Criar os dois volumes, para que seu conteúdo fique disponível no container
VOLUME ["web", "db"]

# Iniciar o apache quando a imagem iniciar
CMD ["apachectl", "-DFOREGROUND"]


