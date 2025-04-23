
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
| 2024-03-07    |     2697 |              0 |                   0 | 10;11;13;25;27;42 |    10 |    11 |    13 |    25 |    27 |    42 |
| 2024-03-05    |     2696 |              1 |           206475190 | 4;13;18;39;55;59  |     4 |    13 |    18 |    39 |    55 |    59 |
| 2024-03-02    |     2695 |              0 |                   0 | 15;17;32;33;34;40 |    15 |    17 |    32 |    33 |    34 |    40 |
| 2024-02-29    |     2694 |              0 |                   0 | 7;20;22;29;41;58  |     7 |    20 |    22 |    29 |    41 |    58 |
| 2024-02-27    |     2693 |              0 |                   0 | 11;29;44;45;46;50 |    11 |    29 |    44 |    45 |    46 |    50 |
| 2024-02-24    |     2692 |              0 |                   0 | 9;33;45;55;56;59  |     9 |    33 |    45 |    55 |    56 |    59 |
| 2024-02-22    |     2691 |              0 |                   0 | 13;15;28;37;40;57 |    13 |    15 |    28 |    37 |    40 |    57 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2697 |                               607 |                    0.23 |        24495626 |    289420865 |    348732.75 |                   16182 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3047 |                              2715 |                    0.89 |          929199 |      8252873 |     10712.22 |                   45705 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6384 |                              2546 |                    0.40 |         3375014 |    579215957 |     14230.37 |                   31920 |                    4 |                     3 |
| Lotomania    | 1999-10-02             |                 2593 |                               673 |                    0.26 |         2399655 |     37261930 |    109348.66 |                   51860 |                   47 |                    96 |
| Timemania    | 2008-03-01             |                 2062 |                                73 |                    0.04 |        26295354 |    818652938 |    164711.44 |                   14434 |                   20 |                    53 |
| Super Sete   | 2020-10-02             |                  516 |                                22 |                    0.04 |         3337346 |     10146164 |    124747.77 |                    3612 |                    9 |                     1 |
| Dia de Sorte | 2018-05-19             |                  884 |                               283 |                    0.32 |          821632 |      4872572 |     59101.35 |                    6188 |                   10 |                     1 |
