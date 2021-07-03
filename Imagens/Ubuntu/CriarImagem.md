# Criar imagem e conteiner

## Baixar a imagem

docker pull ubuntu

## Criar um container a partir da imagem baixada

docker build --tag ubuntu-img .

docker images

REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
ubuntu-img   1.0       31cc795eb98e   29 seconds ago   93.3MB
ubuntu       latest    f643c72bc252   3 weeks ago      72.9MB

## Rodar a imagem como container

docker run --publish 8000:8080 --detach --name bb ubuntu-img:1.0

docker ps -a

docker start ID

## Executar o container

docker run -it ubuntu-img:1.0 /bin/bash

docker ps -a

docker start ID

docker exec -it ID bash 

cat /etc/issue

## Remover container

docker ps -a

docker rm ID

docker rm ID -f

## Remover imagem

docker images

docker rmi ID

raiz
    db
        Dockerfile
    web
        Dockerfile


