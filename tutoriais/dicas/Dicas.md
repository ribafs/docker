# Dicas sobre docker

Remover imagens que não aparecem com nome, mas somente com <none>

docker rmi $(docker images --filter "dangling=true" -q --no-trunc)


## Sintaxe dos arquivos

Uma sring: 

- MYSQL_ROOT_PASSWORD=root

Um array

links:

A indentação é de dois espaços

services:
  php:
    image: ribafs/apache-php:versao1
    ports:
      - 80:80

Acessar site do terminal:

curl -I http://localhost:8080


Remover

docker system prune
----------

Em caso de problema ao criar o container com imagem do mysql ou mariadb

Após

docker-compose down -v
docker-compose up -d

docker exec -it ID bash

Recebe
Error response from daemon: Container 6657ff941c10d55dd35d5320a1f3200c57fcc8d798aa4ee232fc8af7436a1396 is restarting, wait until the container is running

Execute

docker stop CONTAINER_ID
docker rm -v CONTAINER_ID -f

docker images

docker run -it imagemNome bash

service mysql start

mysql -uroot

show databases;

exit

Como o setup.sql foi copiado para a pasta /root

mysql -uroot testes < /root/setup.sql

mysql -uroot

use testes;

select * from clients;

