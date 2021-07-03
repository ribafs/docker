# busybox

Menor imagem do docker até agora - 1.23MB

## Baixar a imagem

docker pull busybox

docker images

busybox         latest    219ee5171f80   2 weeks ago   1.23MB

## Criar container

docker run busybox:latest echo "Como vai?"

Como vai?

## Acessar o shell

docker run -it busybox:latest

exit

docker ps -a

docker start ID

docker exec -it ID sh


