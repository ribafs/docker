apt-get update;
apt-get install -y apache2 libapache2-mod-php8.1 git mcrypt curl composer aptitude;

apt-get install -y mariadb-server postgresql sqlite3;

apt-get install -y php8.1-xml php8.1-xsl php8.1-curl php8.1-xdebug php8.1-intl php8.1 php8.1-bcmath php8.1-mysql php8.1-pgsql php8.1-sqlite3;
apt-get install -y php8.1-zip php8.1-mbstring php8.1-gettext php8.1-gd php-curl php-pear php-apcu;

apt-get install -y php-memcache php-memcached;

a2enmod rewrite;
systemctl restart apache2;

curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
apt-get install -y nodejs;
apt-get autoremove -y;

