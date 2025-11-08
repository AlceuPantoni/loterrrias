# Resultado de um Range de Concursos

Utilize esta função para receber um conjunto de dados contendo os
resultados de um range de concursos, especificando o inicial e o final.

## Usage

``` r
resultado_concursos(
  produto = "megasena",
  num_concurso_inicial,
  num_concurso_final
)
```

## Arguments

- produto:

  Nome do jogo das Loterias que deseja atualizar a base. Caso não
  informado, por padrão será a Megasena [megasena](megasena.md).
  Produtos disponíveis:

  - Megasena -\> digite 'megasena' [megasena](megasena.md)

  - Lotofácil -\> digite 'lotofacil' [lotofacil](lotofacil.md)

  - Quina -\> digite 'quina' [quina](quina.md)

  - Lotomania -\> digite 'lotomania' [lotomania](lotomania.md)

  - Timemania -\> digite 'timemania' [timemania](timemania.md)

  - Super Sete -\> digite 'supersete' [supersete](supersete.md)

  - Dia de Sorte -\> digite 'diadesorte' [diadesorte](diadesorte.md)

- num_concurso_inicial:

  Número do concurso inicial que deseja obter o resultado.

- num_concurso_final:

  Número do concurso final que deseja obter o resultado. Este não é um
  parâmetro obrigatório. Caso informar apenas o concurso inicial, serão
  retornados os dados desde o concurso inicial informado até o concurso
  mais recente que existir no dataset.

## Value

Uma `tibble` - a quantidade de variáveis depende do produto.

## Details

**Importante**: o pacote atualiza as bases diariamente no repositório do
GitHub, porém, sua base local permanece com os dados do momento em que o
pacote foi instalado. Caso tenha intenção de usar as bases diretamente,
sem chamar as funções, reinstale o pacote para obter as bases mais
recentes.

## Examples

``` r
# Visualizar concurso, números sorteados e se houve ganhador referentes aos
# resultados dos concursos entre 1000 a 1500 da Megasena
resultado_concursos(
   produto = 'megasena',
   num_concurso_inicial = 1000,
   num_concurso_final = 1500
 ) |> dplyr::select(concurso, numeros_sorteados, houve_ganhador)
#> # A tibble: 501 × 3
#>    concurso numeros_sorteados houve_ganhador
#>       <dbl> <chr>                      <dbl>
#>  1     1000 29;38;39;49;53;58              0
#>  2     1001 12;15;27;37;51;60              0
#>  3     1002 3;7;25;31;40;58                1
#>  4     1003 5;10;16;23;26;27               1
#>  5     1004 29;40;43;44;45;47              0
#>  6     1005 4;6;12;37;41;42                1
#>  7     1006 2;4;17;33;48;55                1
#>  8     1007 4;27;36;37;49;52               0
#>  9     1008 7;13;15;34;42;48               0
#> 10     1009 1;6;12;29;34;58                1
#> # ℹ 491 more rows
```
