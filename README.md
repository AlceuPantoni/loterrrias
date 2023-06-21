
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
| 2023-06-17     |     2602 |               1 |              51774682 | 11;14;16;30;32;46  |     11 |     14 |     16 |     30 |     32 |     46 |
| 2023-06-14     |     2601 |               0 |                     0 | 3;8;34;40;44;55    |      3 |      8 |     34 |     40 |     44 |     55 |
| 2023-06-10     |     2600 |               0 |                     0 | 4;18;37;38;46;60   |      4 |     18 |     37 |     38 |     46 |     60 |
| 2023-06-07     |     2599 |               0 |                     0 | 23;28;34;43;47;60  |     23 |     28 |     34 |     43 |     47 |     60 |
| 2023-06-03     |     2598 |               1 |              66093916 | 7;14;24;53;58;60   |      7 |     14 |     24 |     53 |     58 |     60 |
| 2023-05-31     |     2597 |               0 |                     0 | 14;26;34;54;56;58  |     14 |     26 |     34 |     54 |     56 |     58 |
| 2023-05-27     |     2596 |               0 |                     0 | 34;35;39;47;51;56  |     34 |     35 |     39 |     47 |     51 |     56 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2602 |                                  590 |                      0.23 |       23642311.5 |     289420865 |     348732.75 |                     15612 |                     10 |                      26 |
| Lotofácil     | 2003-09-29               |                  2842 |                                 2551 |                      0.90 |         907112.9 |       8252873 |      10712.22 |                     42630 |                     20 |                      16 |
| Quina         | 1994-03-13               |                  6171 |                                 2509 |                      0.41 |        3296868.3 |     579215957 |      14230.37 |                     30855 |                      4 |                      47 |
| Lotomania     | 1999-10-02               |                  2483 |                                  661 |                      0.27 |        2298905.6 |      37261930 |     109348.66 |                     49660 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  1952 |                                   72 |                      0.04 |       26323286.7 |     818652938 |     164711.44 |                     13664 |                     20 |                      53 |
| Super Sete    | 2020-10-02               |                   408 |                                   20 |                      0.05 |        3150135.9 |      10146164 |     124747.77 |                      2856 |                      9 |                       4 |
| Dia de Sorte  | 2018-05-19               |                   773 |                                  262 |                      0.34 |         781307.8 |       3770060 |      59101.35 |                      5411 |                     10 |                       1 |
