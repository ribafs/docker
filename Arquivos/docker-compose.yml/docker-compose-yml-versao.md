# Versão do docker-compose.yml

Tomemos cuidado com a vesão do docker-compose.yml

Ela depende da versão do docker instalada

Saber a versão

docker -v

## Tabela com a correspondência das versões

Do service no docker-compose.yml e do docker  isntalado

https://docs.docker.com/compose/compose-file/

https://docs.docker.com/compose/compose-file/compose-versioning/

Exemplos

3.8 	19.03.0+
3.7 	18.06.0+
3.6 	18.02.0+
3.5 	17.12.0+
3.4 	17.09.0+
3.3 	17.06.0+
3.2 	17.04.0+

A recomendação é usar uma versão entre 2.2 e 3.3

Aqui funciona até com a versão 3.6, acima dá erro

ERROR: Version in "./docker-compose.yml" is unsupported. You might be seeing this error because you're using the wrong Compose file version. Either specify a supported version (e.g "2.2" or "3.3") and place your service definitions under the `services` key, or omit the `version` key and place your service definitions at the root of the file to use version 1.
For more on the Compose file format versions, see https://docs.docker.com/compose/compose-file/


