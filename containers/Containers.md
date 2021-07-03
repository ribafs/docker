# Containers

Para que seja possível reutilizarmos um container é importante também que nossos containers sejam nomeados corretamente.

O compartilhamento de recursos entre a máquina local e o container é necessário por diversos fatores. Compartilhamento de volumes, compartilhamento de portas e até mesmo compartilhamento de rede.

## Mapeamento de um volume local para dentro do container

Para fazermos o mapeamento de volumes locais para dentro de um volume vamos utilizar ainda o conceito de mapeamento de volume do frontend de nosso site. Aqui iremos criar uma pasta chamada website-frontend com um arquivo index.html e vamos expor para dentro do container.

## Iniciando containers como Daemons

Agora nós iremos utilizar o Docker como daemons ou seja vamos iniciar estes containers de forma que ele execute os processos mas não de forma interativa:

docker run -dr --name apache-container apache-image

## Vendo os logs de um container
Imaginando que ainda temos o container apache-container no ar nós vamos agora listar todos os logs deste container. Deixemos este container rodando neste terminal e abramos outro terminal para executar:

docker container logs apache-container

## Inspecionando um container

Através do comando inspect você pode ter todos os metadados correspondentes a um container. Nele você pode tirar informações como quantidade de memória, volume apontado, dados de rede, tempo de execução e muito mais.

Sendo assim vamos executar:

docker container inspect apache-container

## Diferenças entre Docker Hub e Docker Registry

De uma forma resumida o Docker Hub é um serviço em nuvem que possibilita que você faça o download de imagens e também registre suas imagens de forma pública. 
O Docker Registry é um repositório server-side que possibilita que você registre suas imagens de forma privada, dentro de sua empresa

## Criando container partindo da imagen

Diretamente da imagem

docker pull debian

docker run -td --name container-debian debian

docker inages - 114MB

docker exec -it container-debian bash


docker pull ubuntu

docker run -td --name meu_ubuntu ubuntu

docker images - 72.9MB

docker exec -it meu_ubuntu bash


docker pull alpine

docker run -t -d --name meu_alpine alpine

docker images - 5.58MB

docker exec -it meu_alpine sh


sqlite3 com alpine

docker pull alpine

docker run -t -d --name meu_alpine alpine

docker images - 5.58MB

docker exec -it meu_alpine sh

apk add sqlite

sqlite3 --version

sqlite3 teste


adminer com alpine

docker pull alpine

docker run -t -d --name meu_adminer alpine

docker images - 5.58MB

docker exec -it meu_adminer sh

apk add adminer


