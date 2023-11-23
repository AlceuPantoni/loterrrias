
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
    [Dia\_de\_Sorte`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_diadesorte.xlsx)
  - ***Lotofácil***
    [Lotofacil`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_lotofacil.xlsx)
  - ***Lotomania***
    [Lotomania`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_lotomania.xlsx)
  - ***Mega-Sena***
    [Mega\_Sena`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_megasena.xlsx)
  - ***Quina***
    [Quina`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_quina.xlsx)
  - ***Super Sete***
    [Super\_Sete`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_supersete.xlsx)
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

| data\_apuracao | concurso | houve\_ganhador | valor\_premio\_maximo | numeros\_sorteados | num\_1 | num\_2 | num\_3 | num\_4 | num\_5 | num\_6 |
| :------------- | -------: | --------------: | --------------------: | :----------------- | -----: | -----: | -----: | -----: | -----: | -----: |
| 2023-11-21     |     2658 |               1 |              50248574 | 5;13;39;51;58;60   |      5 |     13 |     39 |     51 |     58 |     60 |
| 2023-11-18     |     2657 |               0 |                     0 | 7;27;32;33;36;53   |      7 |     27 |     32 |     33 |     36 |     53 |
| 2023-11-14     |     2656 |               0 |                     0 | 20;24;27;46;57;58  |     20 |     24 |     27 |     46 |     57 |     58 |
| 2023-11-11     |     2655 |               0 |                     0 | 10;23;30;31;49;56  |     10 |     23 |     30 |     31 |     49 |     56 |
| 2023-11-09     |     2654 |               1 |              11906870 | 11;17;23;36;47;51  |     11 |     17 |     23 |     36 |     47 |     51 |
| 2023-11-07     |     2653 |               0 |                     0 | 14;32;41;43;48;60  |     14 |     32 |     41 |     43 |     48 |     60 |
| 2023-11-04     |     2652 |               0 |                     0 | 13;23;26;29;45;59  |     13 |     23 |     26 |     29 |     45 |     59 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2658 |                                  601 |                      0.23 |       23921194.7 |     289420865 |     348732.75 |                     15948 |                     10 |                      21 |
| Lotofácil     | 2003-09-29               |                  2960 |                                 2646 |                      0.89 |         919421.1 |       8252873 |      10712.22 |                     44400 |                     20 |                      16 |
| Quina         | 1994-03-13               |                  6297 |                                 2529 |                      0.40 |        3344257.2 |     579215957 |      14230.37 |                     31485 |                      4 |                       3 |
| Lotomania     | 1999-10-02               |                  2550 |                                  669 |                      0.26 |        2358451.5 |      37261930 |     109348.66 |                     51000 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  2018 |                                   73 |                      0.04 |       26295353.9 |     818652938 |     164711.44 |                     14126 |                     20 |                      53 |
| Super Sete    | 2020-10-02               |                   474 |                                   21 |                      0.04 |        3390765.6 |      10146164 |     124747.77 |                      3318 |                      9 |                       4 |
| Dia de Sorte  | 2018-05-19               |                   839 |                                  274 |                      0.33 |         790878.2 |       3770060 |      59101.35 |                      5873 |                     10 |                       1 |
