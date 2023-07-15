
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
| 2023-07-12     |     2610 |               0 |                     0 | 10;23;34;53;55;57  |     10 |     23 |     34 |     53 |     55 |     57 |
| 2023-07-08     |     2609 |               0 |                     0 | 3;21;27;32;35;60   |      3 |     21 |     27 |     32 |     35 |     60 |
| 2023-07-05     |     2608 |               0 |                     0 | 7;13;17;24;29;52   |      7 |     13 |     17 |     24 |     29 |     52 |
| 2023-07-01     |     2607 |               1 |              44355155 | 7;11;25;51;57;60   |      7 |     11 |     25 |     51 |     57 |     60 |
| 2023-06-29     |     2606 |               0 |                     0 | 2;10;16;32;45;49   |      2 |     10 |     16 |     32 |     45 |     49 |
| 2023-06-27     |     2605 |               0 |                     0 | 5;11;26;35;46;54   |      5 |     11 |     26 |     35 |     46 |     54 |
| 2023-06-24     |     2604 |               0 |                     0 | 16;17;19;22;46;57  |     16 |     17 |     19 |     22 |     46 |     57 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2610 |                                  591 |                      0.23 |       23677358.6 |     289420865 |     348732.75 |                     15660 |                     10 |                      26 |
| Lotofácil     | 2003-09-29               |                  2863 |                                 2567 |                      0.90 |         908798.4 |       8252873 |      10712.22 |                     42945 |                     20 |                      16 |
| Quina         | 1994-03-13               |                  6189 |                                 2513 |                      0.41 |        3304342.9 |     579215957 |      14230.37 |                     30945 |                      4 |                      47 |
| Lotomania     | 1999-10-02               |                  2494 |                                  663 |                      0.27 |        2314731.8 |      37261930 |     109348.66 |                     49880 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  1962 |                                   72 |                      0.04 |       26323286.7 |     818652938 |     164711.44 |                     13734 |                     20 |                      53 |
| Super Sete    | 2020-10-02               |                   419 |                                   20 |                      0.05 |        3150135.9 |      10146164 |     124747.77 |                      2933 |                      9 |                       4 |
| Dia de Sorte  | 2018-05-19               |                   783 |                                  265 |                      0.34 |         784242.3 |       3770060 |      59101.35 |                      5481 |                     10 |                       1 |
