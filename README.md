
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
| 2025-06-28    |     2881 |              0 |                   0 | 11;13;16;34;35;39 |    11 |    13 |    16 |    34 |    35 |    39 |
| 2025-06-26    |     2880 |              0 |                   0 | 8;14;15;33;34;54  |     8 |    14 |    15 |    33 |    34 |    54 |
| 2025-06-24    |     2879 |              0 |                   0 | 11;20;29;47;52;56 |    11 |    20 |    29 |    47 |    52 |    56 |
| 2025-06-21    |     2878 |              1 |           127048366 | 15;16;43;46;47;51 |    15 |    16 |    43 |    46 |    47 |    51 |
| 2025-06-17    |     2877 |              0 |                   0 | 3;5;15;37;54;57   |     3 |     5 |    15 |    37 |    54 |    57 |
| 2025-06-14    |     2876 |              0 |                   0 | 9;31;32;40;45;55  |     9 |    31 |    32 |    40 |    45 |    55 |
| 2025-06-12    |     2875 |              0 |                   0 | 6;15;31;38;40;49  |     6 |    15 |    31 |    38 |    40 |    49 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2881 |                               634 |                    0.22 |      26063270.1 |    289420865 |    348732.75 |                   17286 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3429 |                              3034 |                    0.88 |        968286.0 |      8252873 |     10712.22 |                   51435 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6760 |                              2597 |                    0.38 |       3562279.7 |    579215957 |     14230.37 |                   33800 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2789 |                               696 |                    0.25 |       2542702.5 |     37261930 |    109348.66 |                   55780 |                   47 |                    96 |
| Timemania    | 2008-03-01             |                 2261 |                                78 |                    0.03 |      25486153.3 |    818652938 |    164711.44 |                   15827 |                   20 |                    53 |
| Super Sete   | 2020-10-02             |                  712 |                                29 |                    0.04 |       3086601.8 |     10146164 |    124747.77 |                    4984 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1082 |                               337 |                    0.31 |        820650.6 |      4872572 |     59101.35 |                    7574 |                   10 |                     1 |
