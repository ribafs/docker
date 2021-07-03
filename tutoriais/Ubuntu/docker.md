# Criar container docker com Ubuntu 20.04

## Baixar a imagem

docker pull ubuntu

## Criar um container e rodar a imagem de forma interativa

docker run -it ubuntu bash

exit

## Listar os containers

docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED          STATUS                     PORTS     NAMES
d20f7c3ab65d   ubuntu    "bash"    24 seconds ago   Exited (0) 5 seconds ago             flamboyant_hellman

Obs.: Quando aparece uma mensagem como esta:

Exited (0) 5 seconds ago

Indica que o container foi criado mas não está ativo. Isso geralmente ocorre devido algum problema no Dockerfile ou mesmo no docker-compose.yml

Imagem original com 73MB

## Iniciar o container

docker start flamboyant_hellman

Agora ele aparece com apenas

docker ps

## Executar o container startado

Efetuar alterações na imagem, instalando pacotes, removendo e configurando e salvará todas as alterações

O comando abaixo acessa o container e permite que instalemos pacotes, removamos e configuramos e após sair ainda guarda tudo que fizemos. Requer docker start antes

docker exec -it flamboyant_hellman bash

## Atualizar os repositórios

apt update

## Instalar pacotes via script

Criarei no conteiner um script para instalar os pacotes do lamp e cia

## Configurações

php - display_erros = On

apache - ServerName localhost e trocar None por All nas 3 ocorrências

mysql sem sudo e sem senha

Para ser usado no desktop:

## Verificar vesões

php -v
apache2 -v
mysql --version

## Acessar o servidor web

http://172.17.0.2

docker images

Mostra a imagem ainda com o mesmo tamanho de quando baixei, 72.9 MB

## Salvar as mudanças para uma nova imagem

docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED          STATUS          PORTS     NAMES
d20f7c3ab65d   ubuntu    "bash"    27 minutes ago   Up 27 minutes             flamboyant_hellman

docker commit -m "Ubuntu 20.04 com Apache, PHP, Mysql e cia" -a "Ribamar FS [ribafs@gmail.com]" d20f7c3ab65d ribafs/ubuntu

docker images
REPOSITORY      TAG       IMAGE ID       CREATED          SIZE
ribafs/ubuntu   latest    33e6cf917614   28 seconds ago   645MB
ubuntu          latest    f643c72bc252   2 weeks ago      72.9MB

Veja que a imagem ribafs/ubuntu agora tá com 645MB e a original continua aqui.

## Verificar o conteúdo da nossa imagem

docker run -it ubuntu bash

service mysql start

mysql -uroot

exit

## Criar um usuário comum

docker ps -a
CONTAINER ID   IMAGE           COMMAND   CREATED          STATUS                          PORTS     NAMES
2cbf7e3ddef6   ribafs/ubuntu   "bash"    3 minutes ago    Exited (0) About a minute ago             recursing_greider
d20f7c3ab65d   ubuntu          "bash"    35 minutes ago   Up 34 minutes                             flamboyant_hellman

docker start 2cbf7e3ddef6
docker exec -it recursing_greider bash

adduser ribafs

su - ribafs

mysql -uroot

## Vamos salvar também este user na nossa imagem

docker ps -a
CONTAINER ID   IMAGE           COMMAND   CREATED          STATUS          PORTS     NAMES
2cbf7e3ddef6   ribafs/ubuntu   "bash"    7 minutes ago    Up 3 minutes              recursing_greider
d20f7c3ab65d   ubuntu          "bash"    39 minutes ago   Up 38 minutes             flamboyant_hellman

docker commit -m "Ubuntu 20.04 com Apache, PHP, Mysql e cia" -a "Ribamar FS [ribafs@gmail.com]" 2cbf7e3ddef6 ribafs/ubuntu

Vejamos como está agora

docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
ribafs/ubuntu   latest    6bd7e335cdf7   6 seconds ago   772MB
ubuntu          latest    f643c72bc252   2 weeks ago     72.9MB

Aumentou para 772MB.

Tem tudo que eu preciso para trabalhar com PHP em meu desktop ou em um servidor.

Em servidor apenas troco a senha do root do mysql/mariadb

## Enviando imagens para o repositório do docker/docker hub

### Efetuar login no docker hub - https://hub.docker.com

docker login -u ribafs

docker push ribafs/ubuntu

Obrigatório passar como prefixo do noem da imagem o seu login no docker hub: ribafs/

Após concluir acesse

https://hub.docker.com

Veja o novo repositório criado.


