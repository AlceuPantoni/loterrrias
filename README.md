
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
| 2022-09-24     |     2523 |               0 |                     0 | 1;10;27;36;37;45   |      1 |     10 |     27 |     36 |     37 |     45 |
| 2022-09-21     |     2522 |               0 |                     0 | 4;5;25;32;39;40    |      4 |      5 |     25 |     32 |     39 |     40 |
| 2022-09-17     |     2521 |               0 |                     0 | 23;28;33;38;55;59  |     23 |     28 |     33 |     38 |     55 |     59 |
| 2022-09-15     |     2520 |               0 |                     0 | 2;17;22;41;58;60   |      2 |     17 |     22 |     41 |     58 |     60 |
| 2022-09-13     |     2519 |               0 |                     0 | 3;8;20;36;38;57    |      3 |      8 |     20 |     36 |     38 |     57 |
| 2022-09-10     |     2518 |               0 |                     0 | 3;22;23;44;53;60   |      3 |     22 |     23 |     44 |     53 |     60 |
| 2022-09-08     |     2517 |               0 |                     0 | 1;5;6;16;22;39     |      1 |      5 |      6 |     16 |     22 |     39 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2523 |                                  575 |                      0.23 |       22450538.9 |     289420865 |     348732.75 |                     15138 |                     53 |                      26 |
| Lotofácil     | 2003-09-29               |                  2624 |                                 2360 |                      0.90 |         889948.4 |       8227507 |      10712.22 |                     39360 |                     20 |                       8 |
| Quina         | 1994-03-13               |                  5960 |                                 2470 |                      0.41 |        3232789.7 |     579215957 |      14230.37 |                     29800 |                      4 |                      47 |
| Lotomania     | 1999-10-02               |                  2370 |                                  643 |                      0.27 |        2250693.5 |      37261930 |     109348.66 |                     47400 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  1840 |                                   68 |                      0.04 |       27234282.4 |     818652938 |     164711.44 |                     12880 |                     21 |                      53 |
| Super Sete    | 2020-10-02               |                   300 |                                   18 |                      0.06 |        2458611.5 |       7786503 |     124747.77 |                      2100 |                      9 |                       1 |
| Dia de Sorte  | 2018-05-19               |                   661 |                                  230 |                      0.35 |         815008.5 |       3770060 |      59101.35 |                      4627 |                     10 |                       1 |
