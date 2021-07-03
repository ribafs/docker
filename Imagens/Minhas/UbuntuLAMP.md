# Imagem com Ubuntu 20.04

- Apache2, 
- PHP 7.4
- MariaDB 10

Executar

exit

docker exec -it IDContainerMaria bash

service mysql status
service mysql start
mysql -uroot
create database testes;

Importar script para cá
exit

docker start IDContainerWeb

docker exec -it IDContainerWeb bash

service apache2 start

Criar user ribafs

Criar script para ajustar permissões do /var/www/html
Executar

exit

docker inspect ContainerID | grep IPAddress

Acessar

http://172.26.0.3

Acusou a falta de driver

apt install php7.4-pdo-mysql

service apache2 restart

Acessou, mas reclama
Error!: SQLSTATE[HY000] [2002] No such file or directory

Vejo o IP do maria - 172.26.0.2

Volto ao container web e mudo a conexão com o banco para 172.26.0.2

Agora
Error!: SQLSTATE[HY000] [2002] Connection refused

Então vou configurar o mysql para que rode sem sudo e sem senha



### Agora faça o restore do banco:
```
docker exec -i mysql-container mysql -uroot -proot < db/script.sql
```
## Acessar o container php

docker exec -it php-container bash

php -v
apache2 -v

apt update
apt install nano wget unzip


## Acessar

http://172.17.0.3

Caso precise verificar o IP

docker ps -a

docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name_or_id

ou

docker inspect ContainerID | grep IPAddress

