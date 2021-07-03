# Como criei estas imagens e containers

Inspirado no repositório da referência abaixo

## Baixar a imagem - ubuntu

docker pull ubuntu

Tem originalmente 72.9MB

## Criar container

docker run -it IDImagem bash

exit

## Iniciar container

docker start IDContainer

docker exec -it IDContainer bash

apt update

### Instalar php e apache

Configurar apache (servername e trocar none por all) e php (exibir erros) para uso no desktop

exit

## Salvar alterações em outra imagem

docker ps -l

docker commit -m "Ubuntu 20.04 com Apache, PHP e cia" -a "Ribamar FS [ribafs@gmail.com]" 2e8f7c3c95b1 ubuntu-php

docker images
```bash
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
ubuntu-php   latest    7e0ff6e60c32   29 seconds ago   295MB
ubuntu       latest    f643c72bc252   2 weeks ago      72.9MB
```
Nossa imagem ficou com 295 MB

## Enviando imagens para o repositório do docker/docker hub

docker login -u ribafs
```bash
docker tag ubuntu-php ribafs/ubuntu-php
docker rmi ubuntu-php
```
docker push ribafs/ubuntu-php

Obs: para enviar é obrigatório que tenha o login/ como prefixo.

ubuntu-php não vai

ribafs/ubuntu-php vai

## MySQL

Baixarei a imagem ubuntu novamente

E instalarei o mariadb e enviarei para meu repositório no docker hub

Wntão a usarei no docker-compose.yml


Usarei a imagem mariadb

Temos atualmente a seguinte estrutura

- lamp
    - mariadb
        - Dockerfile
        - script.sql
    - web
        - assets
            - css
                - bootstrap.min.css
        - connection.php
        - Dockerfile
        - index.php
