PostgreSQL com Debian

docker pull debian

docker inages - 114MB (debian)

docker run -td --name pg-container debian

docker exec -it pg-container bash

cat /etc/issue - Debian 10

apt update

apt install -y postgresql nano

service postgresql start

su - postgres

psql

11.9

exit

## Salvar as alterações em outra images

docker commit pg-container ribafs/postgres

docker images

Ficou com 468 após instalar o postgres. Vejamos com Ubuntu 20.04

Nossa imagem ficou com 233MB

## Enviar para o docker hub

docker login

docker push ribafs/postgres

