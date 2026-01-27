# Resumo Histórico de Todos os Produtos

Utilize esta função para obter um resumo histórico de todos os produtos
das Loterias do Brasil.

## Usage

``` r
historico_resumido_produtos()
```

## Value

Uma `tibble` contendo sete variáveis.

## Details

Dados presentes no resumo:

- **nome_produto** (character)

- **data_primeiro_concurso** (date)

- **quantidade_concursos** (numeric)

- **quantidade_concursos_com_ganhador** (numeric)

- **percentual_com_ganhador** (numeric)

- **media_premiacao** (numeric)

- **maior_premio** (numeric)

- **menor_premio** (numeric)

- **total_dezenas_sorteadas** (numeric)

- **numero_mais_sorteado** (numeric)

- **numero_menos_sorteado** (numeric)

## Examples

``` r
# Gerando o resumo e filtrando o nome do produto, a quatidade de concursos
# e o percentual do concursos em que houve ganhador
historico_resumido_produtos() |>
 dplyr::select(nome_produto, quantidade_concursos, percentual_com_ganhador)
#> # A tibble: 7 × 3
#>   nome_produto quantidade_concursos percentual_com_ganhador
#>   <chr>                       <dbl>                   <dbl>
#> 1 Mega-sena                    2964                    0.22
#> 2 Lotofácil                    3597                    0.88
#> 3 Quina                        6937                    0.38
#> 4 Lotomania                    2880                    0.25
#> 5 Timemania                    2347                    0.03
#> 6 Super Sete                    803                    0.04
#> 7 Dia de Sorte                 1168                    0.31
```
