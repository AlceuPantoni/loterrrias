
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
| 2026-03-19    |     2986 |              0 |                   0 | 1;5;13;26;41;53   |     1 |     5 |    13 |    26 |    41 |    53 |
| 2026-03-17    |     2985 |              1 |            34856053 | 6;8;21;32;41;60   |     6 |     8 |    21 |    32 |    41 |    60 |
| 2026-03-14    |     2984 |              0 |                   0 | 6;11;15;28;42;60  |     6 |    11 |    15 |    28 |    42 |    60 |
| 2026-03-12    |     2983 |              0 |                   0 | 3;15;30;32;40;52  |     3 |    15 |    30 |    32 |    40 |    52 |
| 2026-03-10    |     2982 |              0 |                   0 | 2;35;41;46;49;58  |     2 |    35 |    41 |    46 |    49 |    58 |
| 2026-03-07    |     2981 |              0 |                   0 | 15;22;27;32;50;58 |    15 |    22 |    27 |    32 |    50 |    58 |
| 2026-03-05    |     2980 |              0 |                   0 | 3;14;27;33;43;45  |     3 |    14 |    27 |    33 |    43 |    45 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2986 |                               650 |                    0.22 |      27266160.7 |    289420865 |    348732.75 |                   17916 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3640 |                              3198 |                    0.88 |        994236.5 |      8252873 |     10712.22 |                   54600 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6980 |                              2631 |                    0.38 |       3632233.0 |    579215957 |     14230.37 |                   34900 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2901 |                               709 |                    0.24 |       2596079.6 |     37261930 |    109348.66 |                   58020 |                   43 |                    96 |
| Timemania    | 2008-03-01             |                 2369 |                                79 |                    0.03 |      26090570.6 |    818652938 |    164711.44 |                   16583 |                   21 |                    53 |
| Super Sete   | 2020-10-02             |                  824 |                                32 |                    0.04 |       3179529.6 |     10146164 |    124747.77 |                    5768 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1190 |                               361 |                    0.30 |        833947.1 |      4872572 |     59101.35 |                    8330 |                   10 |                     1 |
