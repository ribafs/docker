# "Instalar pacotes básicos. Tecle Enter para instalar!";
apt-get install -y apache2 libapache2-mod-php7.4 aptitude git composer mc curl phpunit ssh;

# Instalar SGBDs somente para testes locais. Visto que o servidor é outro: 10.0.0.60
# apt-get install -y mysql-server postgresql sqlite;
apt-get install -y mariadb-server postgresql sqlite3;

# "Instalar PHP 7 e extensões. Tecle Enter para instalar!";
# apt-get install -y php7.4 php7.4-bcmath php7.4-gd php7.4-mysql php7.4-pgsql php7.4-sqlite3 php7.4-curl php-zip;
apt-get install -y php7.4 php7.4-bcmath php7.4-gd php7.4-mysql php7.4-pgsql php7.4-pdo-pgsql php7.4-sqlite3 php7.4-curl;
apt-get install -y php-pear php7.4-xml php7.4-xsl php-xdebug php7.4-intl;
apt-get install -y php7.4-zip php7.4-mbstring php7.4-gettext php7.4-fpm;
apt-get install phpmyadmin;
phpenmod mbstring;

# "Instalar suporte a cache no PHP. Tecle Enter para instalar!";
apt-get install -y php-apcu;

wget http://spout.ussg.indiana.edu/linux/ubuntu/pool/main/m/memcached/memcached_1.6.12+dfsg-1_amd64.deb;
dpkg -i memcached_1.6.12+dfsg-1_amd64.deb;
apt-get install -y php-memcache;
rm memcached_1.6.12+dfsg-1_amd64.deb;

a2enmod rewrite;
systemctl restart apache2;

apt-get autoremove -y;

# Instalar outros softwares
apt-get install -y ttf-mscorefonts-installer kazam;
apt-get install -y rar unrar zip unzip p7zip-full ubuntu-restricted-extras kolourpaint;

curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

apt-get update;
apt-get upgrade -y;;
      0) clear;exit;;
   esac
done
