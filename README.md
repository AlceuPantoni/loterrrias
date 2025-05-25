
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
| 2025-05-24    |     2867 |              0 |                   0 | 5;9;15;24;25;60   |     5 |     9 |    15 |    24 |    25 |    60 |
| 2025-05-22    |     2866 |              1 |             2784095 | 1;12;17;19;36;60  |     1 |    12 |    17 |    19 |    36 |    60 |
| 2025-05-20    |     2865 |              1 |            51507068 | 2;25;30;39;47;51  |     2 |    25 |    30 |    39 |    47 |    51 |
| 2025-05-17    |     2864 |              0 |                   0 | 5;6;15;17;31;53   |     5 |     6 |    15 |    17 |    31 |    53 |
| 2025-05-15    |     2863 |              0 |                   0 | 5;23;32;34;47;56  |     5 |    23 |    32 |    34 |    47 |    56 |
| 2025-05-13    |     2862 |              0 |                   0 | 2;4;14;18;22;44   |     2 |     4 |    14 |    18 |    22 |    44 |
| 2025-05-10    |     2861 |              0 |                   0 | 2;21;27;46;51;53  |     2 |    21 |    27 |    46 |    51 |    53 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2867 |                               633 |                    0.22 |      25903736.0 |    289420865 |    348732.75 |                   17202 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3400 |                              3007 |                    0.88 |        966421.1 |      8252873 |     10712.22 |                   51000 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6738 |                              2592 |                    0.38 |       3551166.3 |    579215957 |     14230.37 |                   33690 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2774 |                               695 |                    0.25 |       2530420.3 |     37261930 |    109348.66 |                   55480 |                   47 |                    96 |
| Timemania    | 2008-03-01             |                 2247 |                                78 |                    0.03 |      25486153.3 |    818652938 |    164711.44 |                   15729 |                   20 |                    53 |
| Super Sete   | 2020-10-02             |                  697 |                                29 |                    0.04 |       3086601.8 |     10146164 |    124747.77 |                    4879 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1068 |                               331 |                    0.31 |        823517.4 |      4872572 |     59101.35 |                    7476 |                   10 |                     1 |
