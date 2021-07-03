# Configurações de pos-install

docker exec -it web-container sh

Criar o index.php em /var/www/localhost/htdocs

cd /var/www/localhost/htdocs

nano index.php

Contendo

<h1>Conexão PDO via Docker - PostgreSQL</h1>
<?php
try {
    $dbh = new PDO('pgsql:host=postgres;dbname=testes', 'super', 'super');
    print 'Conectou';
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
?>
<h1>Conexão PDO via Docker - MariaDB</h1>
<?php
try {
    $dbh = new PDO('mysql:host=maria;dbname=testes', 'super', 'super');
    print 'Conectou';
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
?>
<h1>Conexão PDO via Docker - SQLite</h1>
<?php
try {
    $dbh = new PDO('sqlite:/clients.db');
    print 'Conectou';
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}

Contendo as conexões via PDO para maria, postgres e sqlite

chown apache:apache index.php

chmod 755 index.php

Configurar php.ini

nano /etc/php7/php.ini

display_errors = On

Configurar apache

nano /etc/apache2/httpd.conf

ServerName localhost

Descomentar a linha

LoadModule rewrite_module modules/mod_rewrite.so

Trocar as 3 ocorrências de

AllowOverride None

por

AllowOverride All

rc-service apache2 restart


Acesso pelo desktop

Remover o index.html

rm /var/www/localhost/htdocs/index.html

ifconfig

http://172.31.0.3


