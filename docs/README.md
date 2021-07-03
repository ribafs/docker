# ribafs.github.io

## RibaFS Portal

Este era o site https://ribafs.org que usava o CMS Joomla.

Foi exportado do Joomla para site estático. Criar wget.sh com o código abaixo:

```bash
wget \
     --recursive \
     --no-clobber \
     --page-requisites \
     --html-extension \
     --convert-links \
     --restrict-file-names=windows \
     --no-parent \
         $1
```

## Usando
```bash
wget.sh site

ou
wget.sh http://ribafs.org/portal
```

Agora, estando hospedado aqui no GitHub, pode ser baixado completamente e funciona em qualquer pasta do disco. Basta fazer o download deste repositório:

https://github.com/ribafs/ribafs.github.io

