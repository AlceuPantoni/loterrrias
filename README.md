
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
| 2024-02-24     |     2692 |               0 |                     0 | 9;33;45;55;56;59   |      9 |     33 |     45 |     55 |     56 |     59 |
| 2024-02-22     |     2691 |               0 |                     0 | 13;15;28;37;40;57  |     13 |     15 |     28 |     37 |     40 |     57 |
| 2024-02-20     |     2690 |               0 |                     0 | 9;28;33;43;45;55   |      9 |     28 |     33 |     43 |     45 |     55 |
| 2024-02-17     |     2689 |               0 |                     0 | 9;16;20;47;48;52   |      9 |     16 |     20 |     47 |     48 |     52 |
| 2024-02-15     |     2688 |               0 |                     0 | 12;17;33;41;46;54  |     12 |     17 |     33 |     41 |     46 |     54 |
| 2024-02-10     |     2687 |               0 |                     0 | 2;4;24;30;34;50    |      2 |      4 |     24 |     30 |     34 |     50 |
| 2024-02-08     |     2686 |               0 |                     0 | 6;12;20;41;43;59   |      6 |     12 |     20 |     41 |     43 |     59 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2692 |                                  606 |                      0.23 |       24195329.9 |     289420865 |     348732.75 |                     16152 |                     10 |                      26 |
| Lotofácil     | 2003-09-29               |                  3038 |                                 2707 |                      0.89 |         929163.4 |       8252873 |      10712.22 |                     45570 |                     20 |                      16 |
| Quina         | 1994-03-13               |                  6375 |                                 2545 |                      0.40 |        3371414.1 |     579215957 |      14230.37 |                     31875 |                      4 |                       3 |
| Lotomania     | 1999-10-02               |                  2589 |                                  672 |                      0.26 |        2397619.0 |      37261930 |     109348.66 |                     51780 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  2058 |                                   73 |                      0.04 |       26295353.9 |     818652938 |     164711.44 |                     14406 |                     20 |                      53 |
| Super Sete    | 2020-10-02               |                   512 |                                   22 |                      0.04 |        3337346.2 |      10146164 |     124747.77 |                      3584 |                      9 |                       1 |
| Dia de Sorte  | 2018-05-19               |                   879 |                                  281 |                      0.32 |         822606.2 |       4872572 |      59101.35 |                      6153 |                     10 |                       1 |
