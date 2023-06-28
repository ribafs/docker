echo "Instalar pacotes básicos. Tecle Enter para instalar!";
apt-get -y install aptitude unzip ntp ntpdate git;

clear;
echo "Instalar Apache e módulos. Tecle Enter para instalar!";
apt-get -y install apache2 libapache2-mod-php5;
a2enmod rewrite;

clear;
# Instalar SGBDs somente para testes locais. Visto que o servidor é outro: 10.0.0.60
apt-get -y install mysql-server postgresql;

clear;
echo "Instalar PHP 5 e extensões. Tecle Enter para instalar!";
apt-get -y install php5 mcrypt php5-mcrypt php5-gd php5-mysql php5-sqlite php5-pgsql;
apt-get -y install php5-mcrypt php-pear php5-xsl curl php5-curl phpunit php5-xdebug php5-intl;
apt-get -y install php-gettext php5-fpm php-auth;

clear;
echo "Instalar suporte a cache no PHP. Tecle Enter para instalar!";
# Cache de php
apt-get -y install php5-apcu;
apt-get -y install memcached php5-memcache;

