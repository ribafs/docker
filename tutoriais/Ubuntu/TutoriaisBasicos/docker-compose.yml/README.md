# Exemplo de uso do Dockerfile

Do Tutorial Básico sobre Docker - 2

## Estrutura

raiz
    db
        setup.sql
    web
        index.php
    Dockerfile

Veja o conteúdo do Dockerfile neste diretório

## Remover toos os containers, imagens e volumes

Caso esteja apenas testando, aprendendo e queira remover tudo que criou até agora

### Repositórios

docker stop $(docker ps -aq)

docker rm $(docker container ls -aq)

### Imagens

docker rmi -f $(docker images -q)

### Volumes

docker volume rm $(docker volume ls -q)


## Criar um docker-compose.yml

A ideia do docker-compose é que ele administre diversos containers. No caso, cada container terá um Dockerfile e o docker-compose.yml administra todos eles. Divindo em camadas, cada uma delas um container. Exemplo, em um LAMP temos linux, apache, php e mysql entre outros. Podemos ter 3 container: apache, php e mysql, podemos ter 2 apache-php e mysql ou podemos ter apenas um contendo tudo. Quanto mais complexo for o projeto, melhor que seja dividido em camadas/container, para facilitar a administração.

Veja o docker-compose.yml neste diretório

Neste diretório estão o Dockerfile-db e Dockerfile-web.


## Criar as iamgens e os dois containers de uma vez

Criaremos um container partindo do docker-compose.yml, que pega informações dos Dockerfiles

docker-compose down -v

docker-compose up -d

Se observar atentamente os dois Dockerfiles e o docker-compose.yml verá que peguei o Dockerfile da fase anterior e dividi suas responsabilidades para os dois Dockerfiles desta fase. Assim poderia dividir mais e tambem adicionar outras camadas. Poderia dividir e adicionar mais um container somente para o Apache. Poderiamos também adicionar ouro container para o adminer ou para o phpmyadmin. Ainda poderiamos adicionar outro para o sqlite ou para o postgresql e assim vai.

Assim ele cria duas imagens e dois containers

docker images

REPOSITORY    TAG       IMAGE ID       CREATED         SIZE
testes3_web   latest    3d72b72264b3   4 minutes ago   274MB
testes3_db    latest    9b0fc228ee1e   7 minutes ago   468MB
ubuntu        latest    f643c72bc252   3 weeks ago     72.9MB
a imagem ubuntu é a que foi usada pelas outras duas.

Criou as imagens testes3_db e testes3_web (testes3 é o nome do diretório raiz, onde estão meus arquivos e de onde estou executando o docker)

docker ps

CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS          PORTS                    NAMES
3b7da076351b   testes3_db    "/bin/bash"              27 minutes ago   Up 27 minutes   0.0.0.0:3333->3306/tcp   db-cont
efb9d115f8ed   testes3_web   "apachectl -DFOREGRO…"   41 minutes ago   Up 41 minutes   0.0.0.0:8888->80/tcp     web-cont

Criou os containers: db-cont e web-cont

## Acessar o container db-cont

docker exec -it db-cont bash

Experimente

service mysql start

Crie o banco testes

Importe o script /setup.sql como fizemos na fase anterior


### Para criar somente um serviço/container

No nosso caso, o serviço db

docker-compose up -d db

## Acessar o container web-cont

docker exec -it web-cont bash

Verifique o IP do container web-cont

docker inspect web-cont | grep IPAddress

Acesse pelo desktop

http://IP

Verá a página da phpinfo()


