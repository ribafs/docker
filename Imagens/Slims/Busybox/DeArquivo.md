# Criar uma imagem adicionando arquivos locais

Criar diretório

mkdir imagem

cd imagem

Criar um arquivo

nano arquivo.txt

Meu arquivo para uma imagem.

Criar a imagem usando um diretório local como contexto e um Dockerfile passado via stdin

docker build -t imagem:latest -f- . <<EOF
FROM busybox
COPY arquivo.txt .
RUN cat arquivo.txt
EOF


