Este projeto contém dois CRUds, um com mariadb e outro com SQLite

Copie

cp sample.env .env

Abra o .env e altere a gosto a versão do PHP

Antes pare os serviços do seu desktop: apache e mysql

Então execute

docker-compose up -d

Ao final

docker images

docker run -it nomeimagem

Executar:
start.sh

apt install net-tools

ifconfig

Mude o display_errors para on no php.ini, de acordo com a versão usada

nano /etc/php/8.1/apache2/php.ini 
nano /etc/php/7.4/apache2/php.ini
nano /etc/php5/apache2/php.ini

Mudar display_errors para On

a2enmod rewrite

service apache2 restart

Abra no desktop

http://172.17.0.2


Como está configurado, antes de mudar a versão no .env, precisa remover as imagens e contrainers criados antes

Comandos docker

Parar e remover todos os containers rodando:

docker stop $(docker ps -a -q)

docker rm $(docker ps -a -q)

Remover todas as imagens

docker rmi $(docker images -a -q)

Excluir uma imagem forçadamente

docker rmi ID -f

Excluir todos os contaienrs parados

docker rm $(docker ps -a -q)


Uma boa ideia é atualizar o composer para a versão 2 para PHP 7.4 e 8.1:

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/bin/composer

Para a versão 5 do PHP instalar com:

apt update

curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer


