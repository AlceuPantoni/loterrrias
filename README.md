
<!-- README.md is generated from README.Rmd. Please edit that file -->

# loterrrias <img src="man/figures/logo.png" align="right" height="139" />

<!-- badges: start -->

[![R-CMD-Check](https://github.com/AlceuPantoni/loterrrias/actions/workflows/R-CMD-check.yaml/badge.svg?branch=main)](https://github.com/AlceuPantoni/loterrrias/actions/workflows/R-CMD-check.yaml)
[![update-data](https://github.com/AlceuPantoni/loterrrias/actions/workflows/update-data.yaml/badge.svg)](https://github.com/AlceuPantoni/loterrrias/actions/workflows/update-data.yaml)
[![test-coverage](https://github.com/AlceuPantoni/loterrrias/actions/workflows/test-coverage.yaml/badge.svg?branch=main)](https://github.com/AlceuPantoni/loterrrias/actions/workflows/test-coverage.yaml)
[![Codecov test
coverage](https://codecov.io/gh/AlceuPantoni/loterrrias/branch/main/graph/badge.svg)](https://codecov.io/gh/AlceuPantoni/loterrrias?branch=main)
<!-- badges: end -->

Este pacote tem por objetivo disponilizar os dados de diversos produtos
das Loterias da Caixa.

Os dados foram obtidos diretamente do site das [Loterias da
Caixa](https://loterias.caixa.gov.br/Paginas/default.aspx) através do
uso de técnicas de Web Scraping.

Caso necessário, é possível fazer download das base de dados em formado
**.xlsx** através dos links abaixo:

- ***Dia de Sorte***
  [Dia_de_Sorte`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_diadesorte.xlsx)
- ***Lotofácil***
  [Lotofacil`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_lotofacil.xlsx)
- ***Lotomania***
  [Lotomania`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_lotomania.xlsx)
- ***Mega-Sena***
  [Mega_Sena`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_megasena.xlsx)
- ***Quina***
  [Quina`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_quina.xlsx)
- ***Super Sete***
  [Super_Sete`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_supersete.xlsx)
- ***Timemania***
  [Timemania`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_timemania.xlsx)

## Instalação

O pacote loterrrias pode ser instalado através do
[GitHub](https://github.com/) utilizando o código abaixo em seu R:

``` r
# install.packages("devtools")
devtools::install_github("AlceuPantoni/loterrrias")
```

## Exemplos de uso

Abaixo, como exemplo, segue um dos conjuntos de dados disponíveis,
referente ao produto Mega-Sena.

``` r
loterrrias::resultado_todos(produto = 'megasena') |> 
  dplyr::arrange(desc(concurso)) |> 
  head(7) |> 
  knitr::kable()
```

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | numeros_sorteados | num_1 | num_2 | num_3 | num_4 | num_5 | num_6 |
|:--------------|---------:|---------------:|--------------------:|:------------------|------:|------:|------:|------:|------:|------:|
| 2025-08-14    |     2901 |              0 |                   0 | 2;20;28;38;44;47  |     2 |    20 |    28 |    38 |    44 |    47 |
| 2025-08-12    |     2900 |              0 |                   0 | 33;50;54;55;59;60 |    33 |    50 |    54 |    55 |    59 |    60 |
| 2025-08-09    |     2899 |              0 |                   0 | 10;22;28;42;44;51 |    10 |    22 |    28 |    42 |    44 |    51 |
| 2025-08-07    |     2898 |              0 |                   0 | 14;23;30;32;38;48 |    14 |    23 |    30 |    32 |    38 |    48 |
| 2025-08-05    |     2897 |              1 |            99592256 | 1;6;24;27;28;57   |     1 |     6 |    24 |    27 |    28 |    57 |
| 2025-08-02    |     2896 |              0 |                   0 | 8;9;12;16;43;53   |     8 |     9 |    12 |    16 |    43 |    53 |
| 2025-07-31    |     2895 |              0 |                   0 | 9;11;44;51;52;56  |     9 |    11 |    44 |    51 |    52 |    56 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2901 |                               637 |                    0.22 |      26247320.7 |    289420865 |    348732.75 |                   17406 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3469 |                              3064 |                    0.88 |        974135.6 |      8252873 |     10712.22 |                   52035 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6800 |                              2605 |                    0.38 |       3569883.5 |    579215957 |     14230.37 |                   34000 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2809 |                               698 |                    0.25 |       2562257.0 |     37261930 |    109348.66 |                   56180 |                   47 |                    96 |
| Timemania    | 2008-03-01             |                 2281 |                                78 |                    0.03 |      25486153.3 |    818652938 |    164711.44 |                   15967 |                   20 |                    53 |
| Super Sete   | 2020-10-02             |                  732 |                                29 |                    0.04 |       3086601.8 |     10146164 |    124747.77 |                    5124 |                    7 |                     8 |
| Dia de Sorte | 2018-05-19             |                 1102 |                               344 |                    0.31 |        813637.1 |      4872572 |     59101.35 |                    7714 |                   10 |                     1 |
