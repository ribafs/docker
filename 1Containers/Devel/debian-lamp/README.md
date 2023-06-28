Esta imagem contém o LAMP (Apache, MariaDb e PHP 5.6)

Com dois CRUds, um com mariadb e outro com postgresql

Os CRUDs usam PHP, PDO, paginação e bootstrap.

Copie

cp sample.env .env

Abra o .env e altere a gosto a versão do PHP

Então execute

Para garantir, caso queira remover todas as imagens e containers existentes:

Parar todos os containers rodando:

docker stop $(docker ps -a -q)

docker rm $(docker ps -a -q)

Remover todas as imagens

docker rmi $(docker images -a -q)

Criar o container através da imagem

docker-compose up -d

Ao final

docker images

docker run -it nomeimagem

Executar:
start.sh - Se setou o .env para 56

start2.sh - Se setou o .env para 74 ou 81

source /root/.bashrc

ip a

Abra no desktop

http://172.17.0.2
