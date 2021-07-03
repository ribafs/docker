# Erro ao startar mysql no container

Caso falhe ao startar

Error response from daemon: Container f901964d57ddaf70aff89f1e91a4044cd5fe56786787e7298c0d549273befe38 is not running

Saia

Crie um container com outra porta que não esteja em uso ou então remova este container que não levantou

docker stop IDContainer

docker images

docker run --name=NomeContainer -p 3333:3333 -d NomeImagem/ID

Acessar o container

docker ps -q

docker exec -it IDocker bash

service mysql start

mysql -uroot

show databases


