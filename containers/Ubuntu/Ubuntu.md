# ubuntu

Criar um container a partir da imagem oficial ubuntu

Dockerfile

FROM ubuntu

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i pt_BR -c -f UTF-8 -A /usr/share/locale/locale.alias pt_BR.UTF-8
ENV LANG pt_BR.utf8


## Criar conta

https://labs.play-with-docker.com/

## Criar a images

docker login

ls
Dockerfile

docker build -t ubuntu-image -f Dockerfile .

docker images

ubuntu-image   latest    357a5099d277   4 seconds ago   93.3MB

docker run -p 8888:80 <imageID>

docker ps -a

docker start IDContainer

docker exec -it IDContainer bash

