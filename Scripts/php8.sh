apt update
apt install -y apache2 libapache2-mod-php8.0 aptitude git composer mc curl phpunit
apt install -y mysql-server postgresql sqlite3;
apt install -y php8.0 php8.0-bcmath php8.0-gd php8.0-mysql php8.0-pgsql php8.0-pdo-pgsql php8.0-sqlite3 php8.0-curl;
apt install -y php-pear php8.0-xml php8.0-xsl php-xdebug php8.0-intl;
apt install -y php8.0-zip php8.0-mbstring php8.0-fpm;
phpenmod mbstring;
apt install -y php-apcu;
a2enmod rewrite;
systemctl restart apache2;
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
apt install -y nodejs;
apt autoremove -y;apt update;apt upgrade -y

