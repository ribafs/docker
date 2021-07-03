# Tutorial Básico sobre Docker - 1

## Requisitos

Precisa ter o docker e o docker compose instalados.

## Docker hub

O docker hub é o repositório de imagens do docker, que fica em:

https://hub.docker.com/

Onde devemos efetuar o registro gratuitamente, para acessar localmente, após o login

Neste site podemos pesquisar por imagens do docker. Existem as imagens oficiais, que não precisam de um login antes.

Exemplos:

- ribafs/ubuntu

- ubuntu

## Pesquisar imagens via terminal

O docker tem um comando para pesquisar imagens no docker hub através do terminal:

docker search sqlite

## Baixar a imagem ribafs/sqlite

docker pull ribafs/sqlite

Informações sobre a imagem

docker images

ribafs/sqlite   latest    64e964e702ef   26 hours ago   9.35MB

Veja que esta imagem é minúscula, tem apenas 9.35MB. Isso é permitido devido ter sido criada com a distribuição Alpine, que tem menos de 6MB e o sqlite ser pequeno.

## Criar um conteiner com a imagem baixada

docker run -td --name sqlite-container ribafs/sqlite

O comando acima cria um container para a imagem ribafs/sqlite e atribui um container com nome sqlite-container para ela.

docker ps
CONTAINER ID   IMAGE           COMMAND     CREATED         STATUS         PORTS     NAMES
f77b39e38d2f   ribafs/sqlite   "/bin/sh"   6 seconds ago   Up 5 seconds             sqlite-container

## Acessar o shell do container

docker run -it ribafs/sqlite:latest sh

Fique a vontade. Agora está num ambiente reservado, no caso, usando a distribuição alpine.

cat /etc/issue

sqlite3 teste

select * from clients;

.quit - sair

Este é um banco criado como demonstração da imagem. Ele está no arquivo /teste.

Realize algumas alterações, como isntalação de pacotes (apk add pacote), exclusão do banco (drop database teste) e saia.
Quando voltar, usando o mesmmo comando, veja que não salvou as alterações.

## Acessar o shell do container e salvar as alterações feitas no mesmo

Este comando salva as alterações feitas na imagem.

docker exec -it sqlite-container sh



