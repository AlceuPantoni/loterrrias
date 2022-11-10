
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
| 2022-11-09     |     2537 |               1 |              64250536 | 12;24;26;31;37;48  |     12 |     24 |     26 |     31 |     37 |     48 |
| 2022-11-05     |     2536 |               0 |                     0 | 9;22;27;30;33;45   |      9 |     22 |     27 |     30 |     33 |     45 |
| 2022-11-03     |     2535 |               0 |                     0 | 1;3;24;37;51;56    |      1 |      3 |     24 |     37 |     51 |     56 |
| 2022-10-29     |     2534 |               1 |             131566947 | 28;36;39;44;56;60  |     28 |     36 |     39 |     44 |     56 |     60 |
| 2022-10-26     |     2533 |               0 |                     0 | 17;18;20;37;45;53  |     17 |     18 |     20 |     37 |     45 |     53 |
| 2022-10-22     |     2532 |               0 |                     0 | 10;14;17;18;23;30  |     10 |     14 |     17 |     18 |     23 |     30 |
| 2022-10-20     |     2531 |               0 |                     0 | 1;5;18;49;55;56    |      1 |      5 |     18 |     49 |     55 |     56 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2537 |                                  578 |                      0.23 |       22947758.2 |     289420865 |     348732.75 |                     15222 |                     53 |                      26 |
| Lotofácil     | 2003-09-29               |                  2659 |                                 2392 |                      0.90 |         890902.9 |       8227507 |      10712.22 |                     39885 |                     20 |                       8 |
| Quina         | 1994-03-13               |                  5995 |                                 2476 |                      0.41 |        3241964.7 |     579215957 |      14230.37 |                     29975 |                      4 |                      47 |
| Lotomania     | 1999-10-02               |                  2389 |                                  647 |                      0.27 |        2250420.6 |      37261930 |     109348.66 |                     47780 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  1858 |                                   68 |                      0.04 |       27234282.4 |     818652938 |     164711.44 |                     13006 |                     21 |                      53 |
| Super Sete    | 2020-10-02               |                   317 |                                   18 |                      0.06 |        2458611.5 |       7786503 |     124747.77 |                      2219 |                      9 |                       1 |
| Dia de Sorte  | 2018-05-19               |                   679 |                                  237 |                      0.35 |         802898.2 |       3770060 |      59101.35 |                      4753 |                     10 |                       1 |
