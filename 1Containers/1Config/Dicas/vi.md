# Editor vi

## Criar/abrir arquivo

vi arquivo

## Sair do vi forçando sem salvar

Tecle Esc
Digite
:q!

## Modo de edição

vi arquivo

Para entrar no modo de edição e poder alterar o arquivo tecle

Insert


## Sair do vi salvando

Tecle Esc
Digite
:wq!

O vi é um editor de texto do sistema operacional Unix e semelhantes.

Usando

Para chamar o editor, use esta sintaxe:
vi arquivo

Onde arquivo é um arquivo do diretório atual ou um caminho e nome de um arquivo presente em algum sistema de arquivos.

Uma vez iniciado, o editor entra no modo visualização e aguarda comandos do usuário. Para entrar no modo edição que permite alterar o texto, tecle <Insert>. Enquanto estiver no modo edição o editor não recebe comandos, para retornar ao modo visualização tecle <ESC>.

Comandos mais usados

Inserção de caracteres
i - insere texto antes do caracter atual.
I - insere texto no início da linha atual.
a - insere texto após o caracter atual.
A - insere texto no final da linha atual.
o - insere texto no início da próxima linha (inserindo uma nova linha).
O - insere texto no início da linha anterior (inserindo uma nova linha).
OBS: Para sair do modo de inserção de caracteres, digite <ESC>.

Deleção de caracteres:
 <DEL> - deleta a letra anterior ao cursor (depende da configuração).
 x - deleta a letra do cursor
 nx - deleta as próximas n letras
 dw - deleta o restante da palavra atual
 ndw - deleta as n próximas palavras
 u - undelete (restaura o que foi apagado por último ou apaga o que foi inserido por último).
 dd - deleta a linha atual
 ndd - deleta n linhas a partir da atual

Substituição de caracteres:
 s - substitue a letra atual (e entra no modo de inserção).
 S - substitue a linha atual (e entra no modo de inserção).
 r - substitue a letra atual (nao entra no modo de inserção).
 R - entra no modo de substituição (sai com <ESC>).
 ~ - substitue maiusculo/minusculo.
 . - repete o último comando.

Movimentação de cursor
(em algumas situações as setas funcionam):
 j - uma linha para baixo
 k - uma linha para cima
 h - um caracter para a esquerda
 l - um caracter para a direita
 b - volta para o início da palavra.
 w - adianta para a próxima palavra.
 0 - início da linha
 $ - fim da linha
 nG - vai para a linha n (0G ou G vai para a ultima linha).
 % - usado em parenteses para achar o par.
 +n - vai + n linhas para baixo.
 -n - vai n linhas para cima.

Busca de palavras
 /palavra - procura palavra a partir da atual.
 ?palavra - procura palavra a partir da atual (voltando para o início do arquivo).
 n - procura próxima ocorencia (na mesma direcao de busca).
 # - destaca todas as ocorrencias iguais a palavra onde o cursor esta posicionado.

Operações com buffers
 yy - Copia a linha inteira
 nyy - coloca n linhas no buffer (copiar).
 nY - coloca n linhas no buffer (copiar).
 ndd - deleta as n linhas (a partir da atual) e coloca no buffer (copiar).
 p - retira o conteudo do buffer (colar) e coloca após a linha atual.
 P - retira o conteudo do buffer (colar) e coloca antes da linha atual.

Operações de bloco
 ml - marca a linha l (mx marca a linha x, etc usando o alfabeto).
 'a - vai para a linha marcada a.
 Para ler ou escrever o arquivo (ou parte dele) usa-se os comandos:
 :r arquivo - ler o arquivo para dentro do arquivo atual, a partir do local atual.
 :w  - salva alterções
 :w abc - Grava arquivo com o nome 'abc'
 :q - sai sem modificar o arquivo (se foi alterado tem que usar :q!).
 :wq - sai, salvando o arquivo editado.
 ZZ - sai, salvando o arquivo editado.
 :'a,'b[operação] - realiza a operação no bloco contido entre as marcas a e b.
 :d - deleta a linha atual (útil como operação de blocos).
 :s/string1/string2/ - substitue o string1 por string2

https://ubuntuforum-br.org/index.php?topic=15884.0
https://br.ccm.net/faq/9893-tutorial-sobre-vi-vim


