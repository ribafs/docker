PostgreSQL com Ubuntu

docker pull ubuntu

docker images - 72.9MB (ubuntu)

docker run -td --name pg-container ubuntu

docker exec -it pg-container bash

cat /etc/issue - Ubuntu 20.04

apt update

apt 	upgrade -y

No Dockerfile adicionar o código para não interagir para timezone

apt install -y postgresql nano

service postgresql start

su - postgres

psql

12.5

exit

## Salvar as alterações em outra images

docker commit pg-container ribafs/postgres

docker images

No debian 10 cicou com 468 após instalar o postgres. 
No Ubuntu 20.04 ficou com 376MB

## Enviar para o docker hub

docker login

docker push ribafs/postgres


