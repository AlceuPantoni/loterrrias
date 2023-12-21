
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
| 2023-12-16     |     2669 |               0 |                     0 | 4;7;16;35;46;54    |      4 |      7 |     16 |     35 |     46 |     54 |
| 2023-12-14     |     2668 |               0 |                     0 | 1;27;30;41;46;57   |      1 |     27 |     30 |     41 |     46 |     57 |
| 2023-12-12     |     2667 |               0 |                     0 | 1;4;8;21;46;51     |      1 |      4 |      8 |     21 |     46 |     51 |
| 2023-12-09     |     2666 |               1 |              30781665 | 5;25;29;30;43;47   |      5 |     25 |     29 |     30 |     43 |     47 |
| 2023-12-07     |     2665 |               0 |                     0 | 3;14;21;22;37;39   |      3 |     14 |     21 |     22 |     37 |     39 |
| 2023-12-05     |     2664 |               0 |                     0 | 12;15;17;30;40;52  |     12 |     15 |     17 |     30 |     40 |     52 |
| 2023-12-02     |     2663 |               0 |                     0 | 7;11;27;41;56;59   |      7 |     11 |     27 |     41 |     56 |     59 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2669 |                                  603 |                      0.23 |       23952357.9 |     289420865 |     348732.75 |                     16014 |                     10 |                      26 |
| Lotofácil     | 2003-09-29               |                  2984 |                                 2665 |                      0.89 |         922943.4 |       8252873 |      10712.22 |                     44760 |                     20 |                      16 |
| Quina         | 1994-03-13               |                  6321 |                                 2534 |                      0.40 |        3352123.7 |     579215957 |      14230.37 |                     31605 |                      4 |                       3 |
| Lotomania     | 1999-10-02               |                  2562 |                                  670 |                      0.26 |        2368472.5 |      37261930 |     109348.66 |                     51240 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  2030 |                                   73 |                      0.04 |       26295353.9 |     818652938 |     164711.44 |                     14210 |                     20 |                      53 |
| Super Sete    | 2020-10-02               |                   486 |                                   21 |                      0.04 |        3390765.6 |      10146164 |     124747.77 |                      3402 |                      9 |                       4 |
| Dia de Sorte  | 2018-05-19               |                   851 |                                  275 |                      0.32 |         804594.8 |       4562937 |      59101.35 |                      5957 |                     10 |                       1 |
