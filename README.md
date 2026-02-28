
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
| 2026-02-26    |     2977 |              0 |                   0 | 8;19;27;32;38;52  |     8 |    19 |    27 |    32 |    38 |    52 |
| 2026-02-24    |     2976 |              0 |                   0 | 7;9;10;21;28;43   |     7 |     9 |    10 |    21 |    28 |    43 |
| 2026-02-21    |     2975 |              0 |                   0 | 7;10;17;35;44;46  |     7 |    10 |    17 |    35 |    44 |    46 |
| 2026-02-19    |     2974 |              0 |                   0 | 3;10;12;19;37;40  |     3 |    10 |    12 |    19 |    37 |    40 |
| 2026-02-14    |     2973 |              0 |                   0 | 16;24;27;31;45;46 |    16 |    24 |    27 |    31 |    45 |    46 |
| 2026-02-12    |     2972 |              0 |                   0 | 9;10;15;46;49;51  |     9 |    10 |    15 |    46 |    49 |    51 |
| 2026-02-10    |     2971 |              0 |                   0 | 1;27;39;40;46;56  |     1 |    27 |    39 |    40 |    46 |    56 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2977 |                               648 |                    0.22 |      27052637.2 |    289420865 |    348732.75 |                   17862 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3623 |                              3185 |                    0.88 |        993166.9 |      8252873 |     10712.22 |                   54345 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6963 |                              2629 |                    0.38 |       3623672.0 |    579215957 |     14230.37 |                   34815 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2893 |                               708 |                    0.24 |       2595953.1 |     37261930 |    109348.66 |                   57860 |                   43 |                    96 |
| Timemania    | 2008-03-01             |                 2360 |                                79 |                    0.03 |      26090570.6 |    818652938 |    164711.44 |                   16520 |                   21 |                    53 |
| Super Sete   | 2020-10-02             |                  816 |                                32 |                    0.04 |       3179529.6 |     10146164 |    124747.77 |                    5712 |                    7 |                     8 |
| Dia de Sorte | 2018-05-19             |                 1181 |                               361 |                    0.31 |        833947.1 |      4872572 |     59101.35 |                    8267 |                   10 |                     1 |
