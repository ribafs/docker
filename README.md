# Cantinho do Docker

## Atenção

Na pasta docs temos a segjuinte estrutura

- Introdução
     - Instalação no Linux
     - Instalação no Windows
- Projeto
- Conceitos
- Comandos

Este conteúdo acima deve ser visto pelo site - https://ribafs.me/docker. Idealmente acessar o repositório pelo site, onde poderá ter acesso a conteúdo HTML somente visto pelo site.

## Introdução

### Pré-requisitos

Ter um máquina com Linux ou com outro SO mas com uma VM com Linux, assim vai facilitar o aprendizado. Caso tenha windows, recomenda-se o Windows 10 com Ubuntu 20.04 instalado através do docker desktop.

Requer prática com a linha de comando, especialmente com terminais linux, assim como também de administração de servidores.

Embora você possa fazer o download da imagem que quiser a qualquer momento, é muito mais prático manter as imagens locais.

Desta forma você economiza banda e tempo, porém perde em disco. Fica a seu critério manter ou baixar novamente as imagens.

Não são recomendações oficiais, mas preferencialmente tenha pelo menos um processador Dual Core, e 8GB de Ram.

Quanto mais disco você tiver melhor, em casos de discos de 128GB, com pouco espaço, você pode excluir as imagens sempre que não estiver mais utilizando.

A instalação inicial do Docker vai tomar por volta de 2GB de disco.

A primeira coisa que precisamos fazer é criar uma conta no Docker Hub, ela vai ser utilizada tanto para ativação do Docker em nossa máquina quanto para gerenciar nossas imagens.

Preencha todas as informações necessárias e pronto. É importante lembrar que eles verificarão sua conta via E-mail, então não esqueça este passo também.

https://balta.io/artigos/docker-instalacao-configuracao-e-primeiros-passos

## Para Windows

O Docker é baseado na tecnologia LXC (Linux Containers) mas existem atualmente versões para Windows e Mac.

Caso esteja utilizando sistema operacional Windows, recomendamos fortemente o uso do Windows 10 pois ele possui suporte a subsistemas Linux, que são a base do Docker.

Você deve ter o suporte a virtualização habilitado em seu computador

Você deve habilitar o recurso do hyper-v;

## Alpine

O destaque aqui fica para a distribuição linux Alpine, cuja imagem é menor que 6MB e a criação de containers com ela fica com melhor desempenho e mais rápida de criar. Realmente é um pouco mais complexo criar um container com Alpine que com Ubuntu, mas para os que estiverem dispostos a pagar o preço a recompensa virá.

## Sobre o docker

Existe uma recomendação de que o docker não é para usuários iniciantes. Realmente é um assunto que exige alguns pré-requisitos: conhecimentos de linux, de redes e infra-estrutura, além de uma boa determinação para enfrentar uma estrutura complexa.

Em um ambiente de produção, o Docker facilita a criação, o deployment e a execução de aplicações dentro de containers. Os containers permitem que os desenvolvedores reúnam aplicações e todas as suas principais necessidades e dependências em um único pacote que você pode transformar em uma imagem Docker e replicar. As imagens Docker são construídas a partir de Dockerfiles. O Dockerfile é um arquivo onde você define como será a imagem, qual sistema operacional básico ela terá e quais pacotes serão instalados dentro dela.

Imagens Docker muito grandes podem aumentar o tempo necessário para criar e enviar imagens entre clusters e provedores de nuvem. Se, por exemplo, você tem uma imagem do tamanho de um gigabyte para enviar toda vez que um de seus desenvolvedores aciona uma compilação, a taxa de transferência que você cria em sua rede aumentará durante o processo de CI/CD, tornando sua aplicação lenta e, consequentemente, custando seus recursos. Por causa disso, as imagens Docker adequadas para produção devem ter apenas as necessidades básicas instaladas. Uma imagem básica do Alpine fica em torno de 6MB.

Existem várias maneiras de diminuir o tamanho das imagens Docker para otimizá-las em produção. Em primeiro lugar, essas imagens geralmente não precisam de ferramentas de compilação para executar suas aplicações e, portanto, não há necessidade de adicioná-las. Através do uso de um processo de construção multi-stage, você pode usar imagens intermediárias para compilar e construir o código, instalar dependências e empacotar tudo no menor tamanho possível, depois copiar a versão final da sua aplicação para uma imagem vazia sem ferramentas de compilação. Além disso, você pode usar uma imagem com uma base pequena, como o Alpine Linux. O Alpine é uma distribuição Linux adequada para produção, pois possui apenas as necessidades básicas que sua aplicação precisa para executar.

Uma imagem nada mais é do que uma representação imutável de como será efetivamente construído um container. Por conta disso, nós não rodamos ou inicializamos imagens, nós fazemos isso com os containers.

Uma imagem Docker consiste em camadas somente leitura, cada uma das quais representa uma instrução Dockerfile. As camadas são empilhadas e cada uma é um delta das alterações da camada anterior.

Ao executar uma imagem e gerar um contêiner, você adiciona uma nova camada gravável (a “camada do contêiner”) no topo das camadas subjacentes. Todas as alterações feitas no contêiner em execução, como gravar novos arquivos, modificar arquivos existentes e excluir arquivos, são gravadas nesta camada de contêiner gravável.

## O que é Docker?

Docker é um software livre desenvolvido pela Docker Inc. Foi apresentado ao público em 13 de março de 2013 e desde então se tornou uma referência no mundo do desenvolvimento de TI.

Ele permite que os usuários criem ambientes independentes e isolados para iniciar e implantar seus aplicativos. Esses ambientes são chamados de contêineres.

Isso permitirá que o desenvolvedor execute um contêiner em qualquer computador, com qualquer sistema oepracional.

Como você pode ver, com o Docker, não há mais problemas de dependência ou compilação. Tudo o que você precisa fazer é iniciar seu contêiner e seu aplicativo será iniciado imediatamente.

## Mas, o Docker é uma máquina virtual?

Aqui está uma das perguntas mais frequentes sobre o Docker. A resposta é: na verdade, não exatamente.

Pode parecer uma máquina virtual no início, mas a funcionalidade não é a mesma.

Ao contrário do Docker, uma máquina virtual incluirá um sistema operacional completo. Ele funcionará de forma independente e atuará como um computador.

O Docker só compartilhará os recursos da máquina host para executar seus ambientes.

## Por que usar o Docker como desenvolvedor?

Esta ferramenta pode realmente mudar a vida diária de um desenvolvedor. Para melhor responder a esta pergunta, escrevi uma lista não exaustiva dos benefícios que você encontrará:

     - Docker é rápido. Ao contrário de uma máquina virtual, seu aplicativo pode iniciar em alguns segundos e parar com a mesma rapidez.
     - Docker é multiplataforma. Você pode iniciar seu contêiner em qualquer sistema.
     - Os contêineres podem ser construídos e destruídos mais rápido do que uma máquina virtual.
     - Não há mais dificuldades em configurar seu ambiente de trabalho. Depois que seu Docker estiver configurado, você nunca mais terá que reinstalar suas dependências manualmente. Se você mudar de computador ou se um funcionário ingressar na sua empresa, você só precisa fornecer sua configuração.
     - Você mantém seu espaço de trabalho limpo, pois cada um de seus ambientes será isolado e você pode excluí-los a qualquer momento sem afetar o resto.
     - Será mais fácil implantar seu projeto em seu servidor para colocá-lo online.

https://www.digitalocean.com/community/tutorials/como-otimizar-imagens-docker-para-producao-pt

https://www.meupositivo.com.br/panoramapositivo/container-docker/

## Camadas mínimas

Idealmente dividir na maior quantidade possível de containers, para não acontecer de ter um container com mais do que for precisar e não precisar criar um outro. Exemplificando: temos um container com apache e php e então precisaremos trabalhar com nginx. Neste caso ou criamos um container com nginx mais php, ou criaremos um container com nginx e outro com php. Se nosso container com apache e php fosse dividido em dois, um com apache e outro com php, agora nós apenas criariamos um com nginx e proveitariamos o do php. Claro que precisa de ajustes no de php, mas isso podemos fazer para que possa suportar tanto apache quanto nginx.

## Cursos gratuitos

https://www.cursou.com.br/informatica/descomplicando-docker/ ou https://www.linuxpro.com.br/2017/08/curso-de-docker-gratis/

https://www.portalgsti.com.br/cursos/curso-gratuito-docker-conceitos-e-pratica/

https://www.katacoda.com/courses/docker

https://www.jaccon.com.br/curso-gratuito-de-docker-zero-to-hero/
