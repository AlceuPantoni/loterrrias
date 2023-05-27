
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
| 2023-05-24     |     2595 |               0 |                     0 | 1;13;34;39;50;52   |      1 |     13 |     34 |     39 |     50 |     52 |
| 2023-05-20     |     2594 |               0 |                     0 | 7;26;32;35;49;55   |      7 |     26 |     32 |     35 |     49 |     55 |
| 2023-05-17     |     2593 |               0 |                     0 | 10;14;17;25;32;39  |     10 |     14 |     17 |     25 |     32 |     39 |
| 2023-05-13     |     2592 |               0 |                     0 | 15;17;28;34;35;51  |     15 |     17 |     28 |     34 |     35 |     51 |
| 2023-05-11     |     2591 |               1 |              43295767 | 10;11;21;23;28;30  |     10 |     11 |     21 |     23 |     28 |     30 |
| 2023-05-09     |     2590 |               0 |                     0 | 2;12;28;36;43;48   |      2 |     12 |     28 |     36 |     43 |     48 |
| 2023-05-06     |     2589 |               0 |                     0 | 1;15;16;25;32;36   |      1 |     15 |     16 |     25 |     32 |     36 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2595 |                                  588 |                      0.23 |       23522270.7 |     289420865 |     348732.75 |                     15570 |                     10 |                      26 |
| Lotofácil     | 2003-09-29               |                  2822 |                                 2537 |                      0.90 |         904258.3 |       8252873 |      10712.22 |                     42330 |                     20 |                      16 |
| Quina         | 1994-03-13               |                  6159 |                                 2507 |                      0.41 |        3291262.6 |     579215957 |      14230.37 |                     30795 |                      4 |                      47 |
| Lotomania     | 1999-10-02               |                  2473 |                                  660 |                      0.27 |        2295380.7 |      37261930 |     109348.66 |                     49460 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  1941 |                                   71 |                      0.04 |       26626947.0 |     818652938 |     164711.44 |                     13587 |                     20 |                      53 |
| Super Sete    | 2020-10-02               |                   398 |                                   19 |                      0.05 |        2781923.9 |       8601548 |     124747.77 |                      2786 |                      9 |                       4 |
| Dia de Sorte  | 2018-05-19               |                   762 |                                  259 |                      0.34 |         782794.5 |       3770060 |      59101.35 |                      5334 |                     10 |                       1 |
