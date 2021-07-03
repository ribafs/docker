# scratch

Com ela, consigo criar uma imagem completamente do zero sem utilizar nada de ninguém e adicionar o que quizer

docker build -t imagem:latest -f- . <<EOF
FROM scratch
COPY arquivo.txt /
EOF

