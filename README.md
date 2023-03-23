
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
| 2023-03-22     |     2576 |               0 |                     0 | 29;32;33;35;38;43  |     29 |     32 |     33 |     35 |     38 |     43 |
| 2023-03-18     |     2575 |               0 |                     0 | 4;12;14;41;46;53   |      4 |     12 |     14 |     41 |     46 |     53 |
| 2023-03-16     |     2574 |               0 |                     0 | 12;17;43;44;48;60  |     12 |     17 |     43 |     44 |     48 |     60 |
| 2023-03-14     |     2573 |               0 |                     0 | 6;26;32;35;37;49   |      6 |     26 |     32 |     35 |     37 |     49 |
| 2023-03-11     |     2572 |               0 |                     0 | 3;7;15;22;24;50    |      3 |      7 |     15 |     22 |     24 |     50 |
| 2023-03-08     |     2571 |               0 |                     0 | 9;18;33;38;41;51   |      9 |     18 |     33 |     38 |     41 |     51 |
| 2023-03-04     |     2570 |               1 |              33139056 | 8;18;26;27;47;50   |      8 |     18 |     26 |     27 |     47 |     50 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2576 |                                  584 |                      0.23 |       23360834.2 |     289420865 |     348732.75 |                     15456 |                     53 |                      26 |
| Lotofácil     | 2003-09-29               |                  2769 |                                 2492 |                      0.90 |         898029.3 |       8252873 |      10712.22 |                     41535 |                     20 |                       8 |
| Quina         | 1994-03-13               |                  6106 |                                 2498 |                      0.41 |        3264377.8 |     579215957 |      14230.37 |                     30530 |                      4 |                      47 |
| Lotomania     | 1999-10-02               |                  2445 |                                  656 |                      0.27 |        2278188.6 |      37261930 |     109348.66 |                     48900 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  1913 |                                   69 |                      0.04 |       27261125.1 |     818652938 |     164711.44 |                     13391 |                     20 |                      53 |
| Super Sete    | 2020-10-02               |                   373 |                                   19 |                      0.05 |        2781923.9 |       8601548 |     124747.77 |                      2611 |                      9 |                       4 |
| Dia de Sorte  | 2018-05-19               |                   734 |                                  251 |                      0.34 |         793577.7 |       3770060 |      59101.35 |                      5138 |                     10 |                       1 |
