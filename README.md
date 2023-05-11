
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
| 2023-05-09     |     2590 |               0 |                     0 | 2;12;28;36;43;48   |      2 |     12 |     28 |     36 |     43 |     48 |
| 2023-05-06     |     2589 |               0 |                     0 | 1;15;16;25;32;36   |      1 |     15 |     16 |     25 |     32 |     36 |
| 2023-05-03     |     2588 |               0 |                     0 | 9;13;22;31;57;58   |      9 |     13 |     22 |     31 |     57 |     58 |
| 2023-04-29     |     2587 |               1 |              61056498 | 5;10;11;22;23;37   |      5 |     10 |     11 |     22 |     23 |     37 |
| 2023-04-26     |     2586 |               0 |                     0 | 10;18;41;49;53;59  |     10 |     18 |     41 |     49 |     53 |     59 |
| 2023-04-22     |     2585 |               0 |                     0 | 14;26;34;36;43;59  |     14 |     26 |     34 |     36 |     43 |     59 |
| 2023-04-19     |     2584 |               0 |                     0 | 1;5;12;36;53;55    |      1 |      5 |     12 |     36 |     53 |     55 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2590 |                                  587 |                      0.23 |       23488585.0 |     289420865 |     348732.75 |                     15540 |                     10 |                      26 |
| Lotofácil     | 2003-09-29               |                  2808 |                                 2524 |                      0.90 |         902307.6 |       8252873 |      10712.22 |                     42120 |                     20 |                      16 |
| Quina         | 1994-03-13               |                  6145 |                                 2505 |                      0.41 |        3278654.8 |     579215957 |      14230.37 |                     30725 |                      4 |                      47 |
| Lotomania     | 1999-10-02               |                  2466 |                                  659 |                      0.27 |        2295091.3 |      37261930 |     109348.66 |                     49320 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  1934 |                                   71 |                      0.04 |       26626947.0 |     818652938 |     164711.44 |                     13538 |                     20 |                      53 |
| Super Sete    | 2020-10-02               |                   391 |                                   19 |                      0.05 |        2781923.9 |       8601548 |     124747.77 |                      2737 |                      9 |                       4 |
| Dia de Sorte  | 2018-05-19               |                   755 |                                  258 |                      0.34 |         782715.3 |       3770060 |      59101.35 |                      5285 |                     10 |                       1 |
