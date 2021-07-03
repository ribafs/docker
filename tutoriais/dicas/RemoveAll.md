# Remover todos os containers, imagens e volumes

## containers
docker stop $(docker ps -aq)
docker rm $(docker container ls -aq)

## imagens
docker rmi -f $(docker images -q)

## volumes
docker volume rm $(docker volume ls -q)

## prune
docker system prune -fa

This will remove:
    - all stopped containers
    - all volumes not used by at least one container
    - all networks not used by at least one container
    - all images without at least one container associated to them


