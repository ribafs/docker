Standalone

docker run --link some_database:db -p 8080:8080 adminer

Then you can hit http://localhost:8080 or http://host-ip:8080 in your browser.


# Use root/example as user/password credentials

version: '3.1'

services:

  adminer:
    image: adminer
    restart: always
    ports:
      - 8080:8080

  db:
    image: mysql:5.6
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: example


