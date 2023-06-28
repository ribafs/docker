# IP de container

DE fora do container, estando no host

docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name_or_id

docker ps

docker inspect ID

docker inspect ID | grep IPAddress

Criar script

dip

sudo nano /usr/local/bin/dip

docker inspect $1 | grep IPAddress

docker ps

dip IDContainer


