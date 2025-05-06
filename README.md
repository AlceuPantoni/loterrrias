
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
| 2025-05-03    |     2858 |              0 |                   0 | 8;18;27;28;48;52  |     8 |    18 |    27 |    28 |    48 |    52 |
| 2025-04-29    |     2857 |              0 |                   0 | 2;18;28;38;41;50  |     2 |    18 |    28 |    38 |    41 |    50 |
| 2025-04-26    |     2856 |              0 |                   0 | 3;5;10;27;38;48   |     3 |     5 |    10 |    27 |    38 |    48 |
| 2025-04-24    |     2855 |              1 |            25245913 | 12;16;24;31;51;55 |    12 |    16 |    24 |    31 |    51 |    55 |
| 2025-04-19    |     2854 |              1 |            52035653 | 2;13;16;31;44;55  |     2 |    13 |    16 |    31 |    44 |    55 |
| 2025-04-15    |     2853 |              0 |                   0 | 4;18;23;48;53;56  |     4 |    18 |    23 |    48 |    53 |    56 |
| 2025-04-12    |     2852 |              0 |                   0 | 6;22;24;49;53;56  |     6 |    22 |    24 |    49 |    53 |    56 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2858 |                               631 |                    0.22 |      25899799.9 |    289420865 |    348732.75 |                   17148 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3383 |                              2993 |                    0.88 |        963196.8 |      8252873 |     10712.22 |                   50745 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6721 |                              2590 |                    0.39 |       3543527.7 |    579215957 |     14230.37 |                   33605 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2766 |                               694 |                    0.25 |       2517249.1 |     37261930 |    109348.66 |                   55320 |                   47 |                    96 |
| Timemania    | 2008-03-01             |                 2238 |                                77 |                    0.03 |      25625235.1 |    818652938 |    164711.44 |                   15666 |                   20 |                    53 |
| Super Sete   | 2020-10-02             |                  689 |                                29 |                    0.04 |       3086601.8 |     10146164 |    124747.77 |                    4823 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1059 |                               330 |                    0.31 |        819786.3 |      4872572 |     59101.35 |                    7413 |                   10 |                     1 |
