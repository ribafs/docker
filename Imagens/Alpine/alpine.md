# alpine

Distribuição linux pequena e leve

Alpine Linux, o sistema operacional subjacente para muitas imagens oficiais do Docker, é uma ótima escolha para a tarefa. Com apenas 5MB de tamanho, Alpine Linux está na extremidade oposta do espectro das distribuições completas de Linux de alguns anos atrás, que competiam com o Solaris e pretendiam rodar em sistemas de hardware massivos. Esta nova geração de Linux foi projetada para rodar em hardware embarcado e consumir recursos mínimos, tornando-o uma escolha perfeita para contêineres.

O legado do Alpine Linux como um sistema operacional de sistemas embarcados ficou evidente durante minha análise. Muitas das opções de configuração são padronizadas para sistemas incorporados e a documentação em muitas áreas era esparsa ou inexistente. Claramente um sistema projetado e usado principalmente por hackers, o Alpine Linux exigirá que as empresas superem alguns obstáculos para construir seus aplicativos.

As implantações de produção do Alpine Linux terão várias vantagens, incluindo inicialização rápida, uma pegada minimalista e uma postura segura por padrão não encontrada em nenhum outro lugar. Tudo, desde os binários do sistema às bibliotecas C, é projetado para implantações pequenas, rápidas e seguras. Não há inchaço aqui.

A administração do Alpine Linux é diferente dos sistemas Linux tradicionais e levará algum tempo para aprender. A instalação e o gerenciamento de pacotes são únicos até mesmo entre os sistemas operacionais de contêiner, embora bem pensados. Se sua loja de desenvolvimento tiver desenvolvedores acima da média dispostos a fazer o investimento, o Alpine Linux fornecerá uma base sólida, estável e segura para aplicativos por muito tempo.

O Alpine Linux realmente permite que você crie imagens Docker muito pequenas. É baseado no busybox e musl libc. Ele está enraizado no Linux embarcado. Embora muito útil para teste e desenvolvimento, acredito que Alpine é um desafio em um ambiente corporativo usado para CentOS e Debian, onde a proveniência do pacote e patching são críticos e onde o código pode quebrar inesperadamente com muslc.

https://hub.docker.com/_/alpine

SO - Alpine

Tamanhp 5MB

Dockerfile sugerido na página da imagem:

FROM alpine
RUN apk add --no-cache mysql-client
ENTRYPOINT ["mysql"]

## Baixar

docker pull alpine:latest

docker run -dt --name alpine-cont alpine

docker exec -it alpine-cont sh

cat /etc/issue

apk add php

php -v

apk add openrc --no-cache

apk add mysql mysql-client

exit

docker ps -a

docker exec -it ID /bin/sh

https://wiki.alpinelinux.org/wiki/Setting_Up_Apache_with_PHP

apk add openrc --no-cache

Verificar portas

apk add lsof

## Sistema de init

https://wiki.alpinelinux.org/wiki/Alpine_Linux_Init_System

O alpine usa o OpenRC como seu init system.

Não vem instalado na imagem docker.

Instalar

apk add openrc --no-cache

rc-status

    rc-update add <service> <runlevel>

    rc-update del <service> <runlevel>

    rc-service <service> <start stop restart>

    o check services and their set runlevels

    rc <runlevel>

    To change to a different runlevel

    reboot- Equivalent to shutdown -r now from traditional GNU/Linux systems

    halt - Equivalent to shutdown -h now from traditional GNU/Linux systems

    poweroff - To turn off the machine

Comandos

Atualizando pacotes

apk update

Instalando

apk add pacote

Instalar bash

apk add bash

cat /etc/shells

# valid login shells
/bin/sh
/bin/ash
/bin/bash

apk add bash-completion

apk update

Para usar digite

bash

O prompt muda para
bash-5.0#

Arquivos

/etc/passwd
/etc/group

Customizar o shell do bash

cat ~/.bash_profile

https://bash.cyberciti.biz/guide/Customize_the_bash_shell_environments

bash --version

Para instalar o bash numa imagem com alpine, adicionar ao Dockerfile

RUN apk add --no-cache bash

apk add pkgName1 pkgName2
apk add apache2 php7-apache2 php7-gd php7-mysql

apk update && apk upgrade

Listar todos os pacotes em ordem alfabética com informações de descrição

apk info -vv | sort 

Checar se pacote está instalado

apk -e info pkgName

Mostrar tamanho de pacote

apk info -s pkgName

Mostrar todas as informações sobre um pacote

apk info -a pkgName

Estatísticas

apk stats

Busca de pacotes

apk search pkgName

Pesquisar e mostrar a descrição

apk search -v -d 'htop'

Listar todos os pacotes disponíveis

apk search -v

Listar os pacotes do php7

apk search -v 'php7*'


Efetuar upgrade do alpine da versão 3.11 para a 3.12 

- nano /etc/apk/repositories
- Mudar as versões de 3.11 para 3.12
- salvar e fechar
- apk update
- apk upgrade --available && sync
- reboot

Versão do alpine

    cat /etc/alpine-release

The available runlevels are:

    default - Used if no runlevel is specified. (This is generally the runlevel you want to add services to.)
    hotplugged
    manual

https://wiki.alpinelinux.org/wiki/Upgrading_Alpine

https://wiki.alpinelinux.org/wiki/Setting_up_a_ssh-server

apk add openssh

Habilitar no boot

rc-update add sshd

rc-status

https://wiki.alpinelinux.org/wiki/Docker

https://wiki.alpinelinux.org/wiki/Nginx

https://wiki.alpinelinux.org/wiki/Apache

https://wiki.alpinelinux.org/wiki/Setting_Up_Apache_with_PHP

https://wiki.alpinelinux.org/wiki/Drupal


