
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
| 2025-07-31    |     2895 |              0 |                   0 | 9;11;44;51;52;56  |     9 |    11 |    44 |    51 |    52 |    56 |
| 2025-07-29    |     2894 |              0 |                   0 | 5;21;24;25;29;49  |     5 |    21 |    24 |    25 |    29 |    49 |
| 2025-07-26    |     2893 |              0 |                   0 | 10;40;41;45;48;50 |    10 |    40 |    41 |    45 |    48 |    50 |
| 2025-07-24    |     2892 |              0 |                   0 | 14;24;36;44;46;54 |    14 |    24 |    36 |    44 |    46 |    54 |
| 2025-07-22    |     2891 |              0 |                   0 | 19;24;26;34;35;54 |    19 |    24 |    26 |    34 |    35 |    54 |
| 2025-07-19    |     2890 |              0 |                   0 | 15;16;18;32;35;54 |    15 |    16 |    18 |    32 |    35 |    54 |
| 2025-07-17    |     2889 |              0 |                   0 | 13;16;36;39;40;55 |    13 |    16 |    36 |    39 |    40 |    55 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2895 |                               636 |                    0.22 |      26131998.4 |    289420865 |    348732.75 |                   17370 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3458 |                              3056 |                    0.88 |        972399.1 |      8252873 |     10712.22 |                   51870 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6789 |                              2602 |                    0.38 |       3565073.2 |    579215957 |     14230.37 |                   33945 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2804 |                               697 |                    0.25 |       2563981.6 |     37261930 |    109348.66 |                   56080 |                   47 |                    96 |
| Timemania    | 2008-03-01             |                 2275 |                                78 |                    0.03 |      25486153.3 |    818652938 |    164711.44 |                   15925 |                   20 |                    53 |
| Super Sete   | 2020-10-02             |                  727 |                                29 |                    0.04 |       3086601.8 |     10146164 |    124747.77 |                    5089 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1096 |                               342 |                    0.31 |        814548.3 |      4872572 |     59101.35 |                    7672 |                   10 |                     1 |
