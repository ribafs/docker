# Dockerfile

https://docs.docker.com/engine/reference/builder/

    • .dockerignore 
    • FROM - https://docs.docker.com/engine/reference/builder/#from
    • MAINTAINER 
    • RUN 
    • CMD 
    • EXPOSE 
    • ENV 
    • COPY 
    • ENTRYPOINT 
    • VOLUME 
    • USER 
    • WORKDIR 
    • ARG 
    • ONBUILD 
    • STOPSIGNAL 
    • LABEL 

O Docker pode construir imagens automaticamente lendo as instruções de um Dockerfile. Um Dockerfile é um documento de texto que contém todos os comandos que um usuário pode chamar na linha de comando para montar uma imagem. Usando o docker build, os usuários podem criar um build automatizado que executa várias instruções de linha de comando em sucessão num Dockerfile.

Após criar um Dockerfile para o mariadb, acesse seu diretório e execute para criar uma imagem com todos os recursos do Dockerfile:

docker build -t maria-img .

## FROM

FROM [--platform=<platform>] <image>[:<tag>] [AS <name>]

FRFOM httpd:alpine as img

É a única instrução obrigatória do Dockerfile
Aqui aaparece a imagem a ser baixada do docker hub. Exemplos:

FROM <image>[:<tag>]

FROM mariadb
FROM mariadb:latest
FROM alpine:3.12

## LABEL

Define um rótulo para o container

MAINTAINER - deprecated

Em favor do LABEL

LABEL maintainer="Ribamar FS <ribafs@gmail.com>"

LABEL com.example.version="0.0.1-beta"
LABEL vendor1="ACME Incorporated"
LABEL vendor2=ZENITH\ Incorporated
LABEL com.example.release-date="2015-02-12"
LABEL com.example.version.is-production=""
An image can have more than one label.

LABEL vendor=ACME\ Incorporated \
      com.example.is-beta= \
      com.example.is-production="" \
      com.example.version="0.0.1-beta" \
      com.example.release-date="2015-02-12"

## RUN

Executar um comando no container, durante a criação do container. O Docker irá executar os comandos Bash dentro do nosso container.
Esta instrução pode ser executada uma ou mais vezes e, com ela, posso definir quais serão os comandos executados na etapa de criação de camadas da imagem.

RUN apt-get install openjdk-8-jdk -y
RUN ["apt-get", "install" "openjdk-8-jdk" ,"-y"]

Exemplos:

RUN apt-get update
RUN apt-get install -y nano
RUN mkdir /teste
RUN chmod +x /usr/local/bin/teste
RUN chown -R www-data:www-data /var/www/html
RUN addgroup -g 70 -S postgres;
RUN adduser -u 70 -S -D -G postgres -H -h /var/lib/postgresql -s /bin/sh postgres;0
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install -yqq nodejs
RUN npm install
RUN npm run build
RUN docker-php-ext-install pdo pdp_mysql # Ver docker-php-ext-install.txt
RUN /bin/sh -c apt update -yqq
RUN /bin/sh -c a2enmod rewrite expires
DOPY files/boas-vindas.txt /
RUN touch /boas-vindas.txt

Também poemos usar
RUN touch boas-vindas.txt

Observações:
- Não usar somente apt, usar apt-get
- Para a distro alpine, usa-se apk. Para instalar: apk add nano

## -D FOREGROUND

Quando -D FOREGROUND não é passado, o apache é executado em segundo plano e o processo do apache é desconectado do shell. Isso fará com que o contêiner do docker seja interrompido. Então devemos passar para que o container inicie com o apache startado.

CMD ["apachectl", "-DFOREGROUND"]

## ENV

Seta variáveis de ambiente no sistema operacional do container.

Estas são variáveis de ambiente para comandos reutilizáveis. Essas variáveis consistem em pares de “valores-chave” que podem ser acessados dentro do contêiner por scripts e aplicativos. Essa funcionalidade do Docker oferece uma enorme flexibilidade para a execução de programas.

ENV LANG en_US.utf8

ou

ENV LANG=pt_BR.UTF-8 LANGUAGE=pt_BR:en LC_ALL=pt_BR.UTF-8

ENV PGDATA /var/lib/postgresql/data

## ARG

# Desabilita a interatividade com o usuário
ARG DEBIAN_FRONTEND=noninteractive

# make the "en_US.UTF-8" locale so postgres will be utf-8 enabled by default
# alpine doesn't require explicit locale-file generation
ENV LANG en_US.utf8

## ENTRYPOINT

Diretório onde está localizado o binário do container. Define um aplicativo padrão a ser usado sempre que um contêiner é criado com a imagem.
Define o aplicativo padrão concreto que é usado sempre que um contêiner for criado usando a imagem. Por exemplo, se você instalou um aplicativo específico dentro de uma imagem e vai usar essa imagem apenas para executar esse aplicativo, você pode declarar com ENTRYPOINT e sempre que um contêiner for criado a partir dessa imagem, seu aplicativo será o destino.

ENTRYPOINT ["docker-entrypoint.sh"]
ENTRYPOINT application "argument", "argument", ..

Lembre-se: os argumentos são opcionais. Eles podem ser fornecidos pelo CMD ou durante a criação de um contêiner.

CMD "Hello docker!"
ENTRYPOINT echo

## CMD

https://docs.docker.com/engine/reference/builder/#cmd

O script que será executado pelo entrypoint.

É usado para executar um comando assim que um container for iniciado. É diferente de RUN, pois RUN é usado no momento de construir uma imagem.

Caso passássemos algo como "docker run -it <id da imagem> /bin/bash", ele sobrescreveria o comando CMD touch boas-vindas.txt e executaria apenas o /bin/bash.
Podemos ter quantos CMD quisermos, mas no fim das contas apenas será executado o último CMD, sem nenhum erro aparente!

CMD [“echo”, “Hello World”]
CMD ["/bin/bash"]
CMD [ "npm", "start" ]
CMD ["postgres"]
CMD ["apachectl", "-D", "FOREGROUND"] # Startar apache na criação do container

COPY start.sh /start.sh
CMD ["./start.sh"]

### Diferenças entre RUN, CMD e ENTRYPOINT

RUN é uma etapa de construção de imagem, o estado do contêiner após um comando RUN será confirmado na imagem do contêiner. Um Dockerfile pode ter muitos comandos RUN que se "sobrepõem" uns aos outros para construir a imagem.

CMD é o comando que o contêiner executa por padrão quando você inicia a imagem construída. Um Dockerfile usará apenas o CMD final definido. O CMD pode ser substituído ao iniciar um contêiner com docker run $image $other_command.

ENTRYPOINT também está intimamente relacionado ao CMD e pode modificar a maneira como um contêiner inicia uma imagem.

RUN - durante a criação do container
CMD - quando a imagem inicia
ENTRYPOINT - pode modificar a maneira como um container inicia uma imagem

## ADD

Copia arquivos do host para o contaienr e também faz downloads para a imagem/container.
O papel do ADD é fazer a cópia de um arquivo, diretório ou até mesmo fazer o download de uma URL de nossa máquina host e colocar dentro da imagem.

ADD origem destino

Caso o arquivo que esteja sendo passado seja um arquivo de extensão tar, ele fará a descompressão automaticamente, além do fato já mencionado de poder fazer download de arquivos por URLS.

## COPY

https://docs.docker.com/engine/reference/builder/#copy

Copiar arquivos do host para a imagem.

A instrução COPY, permite apenas a passagem de arquivos ou diretórios, diferente do ADD, que permite downloads.

COPY source_dir_ou_file dest_dir_ou_file
COPY docker-entrypoint.sh /usr/local/bin/
COPY clients /var/www/html
COPY . /usr/src/myapp

## WORKDIR

Define o caminho onde o comando, definido com CMD, deve ser executado, onde será executado os comandos e a pasta que será aberta quando iniciarmos o container.

Define a o diretório de trabalho. Essa instrução tem o propósito de definir o nosso ambiente de trabalho. Com ela, definimos onde as instruções CMD, RUN, ENTRYPOINT, ADD e COPY executarão suas tarefas, além de definir o diretório padrão que será aberto ao executarmos o container.

WORKDIR /var/www/html

## EXPOSE

EXPOSE abre uma porta para fora do container, deixando disponível para outros containers. O ports do docker-expose.yml realmente define as postas.

"3306:3306" will publish the port on the host, making the same port accessible from the host.

EXPOSE 8000 3306
EXPOSE 5432

## VOLUME

Usado para permitir o acesso do contêiner a um diretório na máquina host.
Compartilhar informações entre o nosso container e nossa máquina host. Essa instrução cria uma pasta em nosso container que será compartilhada entre o container e o host.

Cria volumes

VOLUME /var/lib/postgresql/data

VOLUME ["/dir_1", "/dir_2" ..]

VOLUME /teste

Todo arquivo criado dentro da pasta /teste do container será acessível a partir da máquina host no caminho /var/lib/docker/volumes

O comando

CMD teste.txt teste2.txt

Copiará o arquivo teste2.txt na pasta /teste

## USER

Define o UID (ou nome de usuário) que deve executar o contêiner, usuário que será utilizado para rodar a aplicação

Referências

https://www.alura.com.br/artigos/desvendando-o-dockerfile

## HEALTHCHECK instrução

A diretiva HEALTHCHECK informa ao Docker como determinar se o estado do contêiner é normal. Esta foi uma nova diretiva introduzida durante o Docker 1.12. Antes da diretiva HEALTHCHECK, o mecanismo Docker só podia determinar se o contêiner estava em um estado de anormalidade se o processo principal no contêiner fosse encerrado. Em muitos casos, isso é bom, mas se o programa entrar em um estado de conflito ou em um estado de loop infinito, o processo do aplicativo não será encerrado, mas o contêiner não será mais capaz de fornecer serviços. Antes do 1.12, o Docker não detectava esse estado do contêiner e não o reprogramava, fazendo com que alguns contêineres não pudessem servir, mas ainda aceitando as solicitações do usuário.

HEALTHCHECK [options] CMD <command>:

A sintaxe acima define o comando para verificar a integridade do contêiner


