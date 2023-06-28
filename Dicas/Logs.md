Logs

Verificar os logs do Docker ajuda a solucionar alguns problemas. Acontece algumas vezes de dar problema e não mostrar mensagem.

docker logs --tail 50 --follow --timestamps IDContainer

docker exec -it --log-driver json-file --log-opt max-size=10m --log-opt max-file=2 ad-cont

docker run -it -p 514:514/udp -p 601:601 -v "$PWD/syslog-ng.conf":/etc/syslog-ng/syslog-ng.conf balabit/syslog-ng:latest -edv

docker run --log-driver syslog --log-opt syslog-address=udp://syslog-server:514 testes_ad:latest echo hello world

docker run --log-opt mode=non-blocking testes_ad:latest echo hello world


Isso usando o somente o Docker, já com o docker-compose podemos usar esse comando:

docker-compose logs

Que vai exibir os logs de todos os serviços no aplicativo definido no arquivo "docker-compose.yml", ou então esse outro comando:

docker-compose logs <nome-do-servico>

Para exibir os logs de um serviço especifico

Em caso de problemas verificar

- logs

ou

- docker-compose --verbose up


