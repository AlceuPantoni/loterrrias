
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
| 2023-01-10     |     2553 |               0 |                     0 | 13;15;53;54;55;58  |     13 |     15 |     53 |     54 |     55 |     58 |
| 2023-01-07     |     2552 |               0 |                     0 | 5;24;25;33;38;41   |      5 |     24 |     25 |     33 |     38 |     41 |
| 2023-01-04     |     2551 |               0 |                     0 | 1;25;29;43;46;48   |      1 |     25 |     29 |     43 |     46 |     48 |
| 2022-12-31     |     2550 |               1 |             108393993 | 4;5;10;34;58;59    |      4 |      5 |     10 |     34 |     58 |     59 |
| 2022-12-17     |     2549 |               0 |                     0 | 1;6;10;30;33;35    |      1 |      6 |     10 |     30 |     33 |     35 |
| 2022-12-14     |     2548 |               1 |             134811174 | 9;15;23;25;29;30   |      9 |     15 |     23 |     25 |     29 |     30 |
| 2022-12-10     |     2547 |               0 |                     0 | 10;25;31;37;38;57  |     10 |     25 |     31 |     37 |     38 |     57 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2553 |                                  580 |                      0.23 |       23287947.3 |     289420865 |     348732.75 |                     15318 |                     53 |                      26 |
| Lotofácil     | 2003-09-29               |                  2711 |                                 2438 |                      0.90 |         895950.7 |       8252873 |      10712.22 |                     40665 |                     20 |                       8 |
| Quina         | 1994-03-13               |                  6048 |                                 2485 |                      0.41 |        3257390.8 |     579215957 |      14230.37 |                     30240 |                      4 |                      47 |
| Lotomania     | 1999-10-02               |                  2416 |                                  652 |                      0.27 |        2252319.1 |      37261930 |     109348.66 |                     48320 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  1884 |                                   68 |                      0.04 |       27234282.4 |     818652938 |     164711.44 |                     13188 |                     20 |                      53 |
| Super Sete    | 2020-10-02               |                   344 |                                   19 |                      0.06 |        2781923.9 |       8601548 |     124747.77 |                      2408 |                      9 |                       5 |
| Dia de Sorte  | 2018-05-19               |                   705 |                                  243 |                      0.34 |         794596.6 |       3770060 |      59101.35 |                      4935 |                     10 |                       1 |
