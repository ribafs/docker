# Imagem oficial joomla

joomla

docker run --name some-joomla --link some-mysql:mysql -d joomla

The following environment variables are also honored for configuring your Joomla instance:

    -e JOOMLA_DB_HOST=... (defaults to the IP and port of the linked mysql container)
    -e JOOMLA_DB_USER=... (defaults to "root")
    -e JOOMLA_DB_PASSWORD=... (defaults to the value of the MYSQL_ROOT_PASSWORD environment variable from the linked mysql container)
    -e JOOMLA_DB_NAME=... (defaults to "joomla")

If the JOOMLA_DB_NAME specified does not already exist on the given MySQL server, it will be created automatically upon startup of the joomla container, provided that the JOOMLA_DB_USER specified has the necessary permissions to create it.
docker run --name some-joomla --link some-mysql:mysql -p 8080:80 -d joomla
docker run --name some-joomla -e JOOMLA_DB_HOST=10.1.2.3:3306 \
    -e JOOMLA_DB_USER=... -e JOOMLA_DB_PASSWORD=... -d joomla

version: '3.1'

services:
  joomla:
    image: joomla
    restart: always
    links:
      - joomladb:mysql
    ports:
      - 8080:80
    environment:
      JOOMLA_DB_HOST: joomladb
      JOOMLA_DB_PASSWORD: example

  joomladb:
    image: mysql:5.6
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: example

