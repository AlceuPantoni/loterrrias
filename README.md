
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
| 2026-02-05    |     2969 |              1 |           141844706 | 1;2;5;14;18;32    |     1 |     2 |     5 |    14 |    18 |    32 |
| 2026-02-03    |     2968 |              0 |                   0 | 10;11;22;26;36;46 |    10 |    11 |    22 |    26 |    36 |    46 |
| 2026-01-31    |     2967 |              0 |                   0 | 1;6;38;47;56;60   |     1 |     6 |    38 |    47 |    56 |    60 |
| 2026-01-29    |     2966 |              0 |                   0 | 6;7;9;43;44;53    |     6 |     7 |     9 |    43 |    44 |    53 |
| 2026-01-27    |     2965 |              0 |                   0 | 1;20;22;23;35;57  |     1 |    20 |    22 |    23 |    35 |    57 |
| 2026-01-24    |     2964 |              0 |                   0 | 3;9;15;17;30;60   |     3 |     9 |    15 |    17 |    30 |    60 |
| 2026-01-22    |     2963 |              0 |                   0 | 6;20;34;44;53;57  |     6 |    20 |    34 |    44 |    53 |    57 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2969 |                               648 |                    0.22 |      27052637.2 |    289420865 |    348732.75 |                   17814 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3607 |                              3170 |                    0.88 |        992260.8 |      8252873 |     10712.22 |                   54105 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6947 |                              2626 |                    0.38 |       3615888.5 |    579215957 |     14230.37 |                   34735 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2885 |                               708 |                    0.25 |       2595953.1 |     37261930 |    109348.66 |                   57700 |                   43 |                    96 |
| Timemania    | 2008-03-01             |                 2352 |                                79 |                    0.03 |      26090570.6 |    818652938 |    164711.44 |                   16464 |                   21 |                    53 |
| Super Sete   | 2020-10-02             |                  808 |                                32 |                    0.04 |       3179529.6 |     10146164 |    124747.77 |                    5656 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1173 |                               359 |                    0.31 |        828982.4 |      4872572 |     59101.35 |                    8211 |                   10 |                     1 |
