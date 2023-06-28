#!/bin/bash
export containerName=maria
export hostAddress=127.0.0.1
export hostPort=3333
export ROOT_USERNAME=root
export ROOT_PASSWORD=
docker pull ${containerName}:latest
docker run --name ${containerName} -v ${CURRENT_PATH}/scripts:/docker-entrypoint-initdb.d -p ${hostPort}:${hostPort} -e MYSQL_ROOT_PASSWORD=${ROOT_PASSWORD} -e MYSQL_DATABASE=${containerName} -e TZ='America/Los_Angeles' -d ${containerName} --verbose --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci &
sleep 15
docker logs -f $containerId &

