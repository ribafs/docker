# docker-compose

Introdução ao docker-compose

Docker compose é uma ferramenta construída pelo docker para facilitar a tarefa de criar e configrar vários contêineres em um ambiente de desenvolvimento contraparte do docker-compose para o ambiente de produção é docker swarm. O Docker compose recebe como entrada um arquivo de configuração YAML e cria os recursos (contêineres, redes, volumes, etc.) comunicando-se com o daemon do docker por meio da API do docker.

O projeto Compose é o projeto de código aberto oficial do Docker e é responsável pela orquestração rápida de clusters de contêineres do Docker. Funcionalmente, é muito semelhante ao Heat OpenStack.

O código está atualmente em código aberto em https://github.com/docker/compose.

Compose posicionado como “Definindo e executando aplicativos Docker de vários contêineres”, e seu predecessor é o projeto de código aberto Fig.

Por meio da introdução na primeira parte, sabemos que o uso de um arquivo de template do Dockerfile permite que os usuários definam facilmente um contêiner de aplicativo separado. No entanto, no trabalho diário, é comum que vários contêineres precisem cooperar para concluir uma determinada tarefa. Por exemplo, para implementar um projeto da Web, além do próprio contêiner de serviço da Web, geralmente é necessário adicionar um contêiner de serviço de banco de dados de back-end e até mesmo um contêiner de balanceamento de carga.

O Compose apenas atende a essa necessidade. Ele permite que o usuário defina um conjunto de contêineres de aplicativos associados como um projeto por meio de um arquivo de modelo docker-compose.yml separado (formato YAML).

Existem dois conceitos importantes no Compose:

Serviço: um contêiner para um aplicativo que pode realmente incluir várias instâncias de contêiner executando a mesma imagem. Exemplo:

service:
  db:
    ...
  web:
    ...

Projeto: uma unidade de negócios completa que consiste em um conjunto de contêineres de aplicativos associados, definidos no arquivo docker-compose.yml.

O objeto de gerenciamento padrão do Compose é um projeto que fornece gerenciamento de ciclo de vida conveniente de um conjunto de contêineres em um projeto por meio de subcomandos.

## docker-compose up

docker-compose down -v

docker-compose up -d

Caso deseje rodar um container definido num docker-compose.yml, que contém apache, php e mariadb e deseja rodar somente o container mariadb sozinho:

docker-compose up mariadb

## docker-compose run

O comando run sempre define um novo container fora dos definidos no arquivo YAML. Este será um container autônomo executado separadamente daqueles do docker-compose.yml e não irá interferir com aqueles já definidos no referido arquivo.

docker-compose run -dt --name novo-container <image-name>

## docker-compose exec

Habilita para interagir com um container e salvar as alterações feitas no mesmo.

docker exec -it php-container bash

docker-compose exec php-container chown -R $USER:www-data /var/www/html

## Levantar somente um contaienr

docker-compose up -d mysql

