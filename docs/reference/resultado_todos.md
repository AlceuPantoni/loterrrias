# Resultados de Todos os Concursos

Utilize esta função para receber um conjunto de dados contendo todos os
resultados do produto escolhido.

## Usage

``` r
resultado_todos(produto = "megasena")
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
# Visualizar concurso, números sorteados e se houve ganhador referente aos
# resultados de todos os concursos da Megasena
resultado_todos(produto = 'megasena') |>
   dplyr::select(concurso, numeros_sorteados, houve_ganhador)
#> # A tibble: 2,955 × 3
#>    concurso numeros_sorteados houve_ganhador
#>       <dbl> <chr>                      <dbl>
#>  1        1 4;5;30;33;41;52                0
#>  2        2 9;37;39;41;43;49               1
#>  3        3 10;11;29;30;36;47              1
#>  4        4 1;5;6;27;42;59                 0
#>  5        5 1;2;6;16;19;46                 0
#>  6        6 7;13;19;22;40;47               0
#>  7        7 3;5;20;21;38;56                0
#>  8        8 4;17;37;38;47;53               0
#>  9        9 8;43;54;55;56;60               0
#> 10       10 4;18;21;25;38;57               0
#> # ℹ 2,945 more rows
```
