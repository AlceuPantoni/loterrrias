
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
| 2025-07-15    |     2888 |              1 |            45115607 | 3;9;15;27;39;59   |     3 |     9 |    15 |    27 |    39 |    59 |
| 2025-07-12    |     2887 |              0 |                   0 | 14;29;30;50;53;57 |    14 |    29 |    30 |    50 |    53 |    57 |
| 2025-07-10    |     2886 |              0 |                   0 | 2;13;19;20;55;59  |     2 |    13 |    19 |    20 |    55 |    59 |
| 2025-07-08    |     2885 |              0 |                   0 | 10;25;28;36;37;56 |    10 |    25 |    28 |    36 |    37 |    56 |
| 2025-07-05    |     2884 |              0 |                   0 | 5;31;34;37;52;56  |     5 |    31 |    34 |    37 |    52 |    56 |
| 2025-07-03    |     2883 |              0 |                   0 | 1;40;43;56;57;60  |     1 |    40 |    43 |    56 |    57 |    60 |
| 2025-07-01    |     2882 |              1 |            50722168 | 11;15;19;23;49;51 |    11 |    15 |    19 |    23 |    49 |    51 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2888 |                               636 |                    0.22 |      26131998.4 |    289420865 |    348732.75 |                   17328 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3443 |                              3046 |                    0.88 |        969993.9 |      8252873 |     10712.22 |                   51645 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6774 |                              2599 |                    0.38 |       3563100.4 |    579215957 |     14230.37 |                   33870 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2796 |                               696 |                    0.25 |       2542702.5 |     37261930 |    109348.66 |                   55920 |                   47 |                    96 |
| Timemania    | 2008-03-01             |                 2268 |                                78 |                    0.03 |      25486153.3 |    818652938 |    164711.44 |                   15876 |                   20 |                    53 |
| Super Sete   | 2020-10-02             |                  719 |                                29 |                    0.04 |       3086601.8 |     10146164 |    124747.77 |                    5033 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1089 |                               340 |                    0.31 |        817174.3 |      4872572 |     59101.35 |                    7623 |                   10 |                     1 |
