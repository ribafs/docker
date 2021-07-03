# httpd

https://hub.docker.com/_/httpd

Debian

docker run -dit --name my-apache-app -p 8080:80 -v "$PWD":/usr/local/apache2/htdocs/ httpd:2.4

docker images
138MB

docker ps

docker exec -it ID bash

Visite
http://localhost:8080

Alpine

Esta imagem é baseada no popular projeto Alpine Linux, disponível na imagem oficial alpina. O Alpine Linux é muito menor do que a maioria das imagens de base de distribuição (~ 5 MB) e, portanto, leva a imagens muito mais finas em geral.

Essa variante é altamente recomendada quando o tamanho final da imagem é o menor possível. A principal advertência a observar é que ele usa musl libc em vez de glibc e amigos, portanto, determinados softwares podem ter problemas dependendo da profundidade de seus requisitos de libc. No entanto, a maioria dos softwares não tem problemas com isso, então essa variante geralmente é uma escolha muito segura. Veja este tópico de comentários do Hacker News para mais discussões sobre os problemas que podem surgir e algumas comparações prós / contras do uso de imagens baseadas em Alpine.

Para minimizar o tamanho da imagem, é incomum que ferramentas adicionais relacionadas (como git ou bash) sejam incluídas em imagens baseadas em Alpine. Usando essa imagem como base, adicione o que você precisa em seu próprio Dockerfile (veja a descrição da imagem alpina para exemplos de como instalar pacotes, se você não estiver familiarizado).

Alpine

Dockerfile

docker run -dit --name my-apache-app -p 8080:80 -v "$PWD":/usr/local/apache2/htdocs/ httpd:alpine

docker images
55.5MB

docker ps

docker exec -it ID sh

Visite
http://localhost:8080

/usr/local/apache2/htdocs/html/


