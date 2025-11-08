# Lista Produtos Disponíveis

Utilize esta função para receber um conjunto de dados contendo todos os
produtos disponíveis.

## Usage

``` r
produtos_existentes()
```

## Value

Uma `tibble` com três variáveis.

## Details

Dataset retornado contém as seguintes variáveis:

- **nome_produto** Nome oficial do produto (character)

- **parametro_produto** String a ser utilizada como parâmetro ao
  executar as funções do pacote (character)

- **qtde_numeros_sorteio** Quantidade de números sorteados (numeric)

## Examples

``` r
# Retorna uma tibble contendo os produtos disponíveis
produtos_existentes()
#> # A tibble: 7 × 3
#>   nome_produto parametro_produto qtde_numeros_sorteio
#>   <chr>        <chr>                            <dbl>
#> 1 Mega-sena    megasena                             6
#> 2 Lotofácil    lotofacil                           15
#> 3 Quina        quina                                5
#> 4 Lotomania    lotomania                           20
#> 5 Timemania    timemania                            7
#> 6 Super Sete   supersete                            7
#> 7 Dia de Sorte diadesorte                           7
```
