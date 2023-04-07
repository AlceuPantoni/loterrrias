
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
| 2023-04-05     |     2580 |               0 |                     0 | 3;4;13;29;36;43    |      3 |      4 |     13 |     29 |     36 |     43 |
| 2023-04-01     |     2579 |               0 |                     0 | 5;10;26;35;38;44   |      5 |     10 |     26 |     35 |     38 |     44 |
| 2023-03-29     |     2578 |               1 |              37457585 | 37;39;47;50;59;60  |     37 |     39 |     47 |     50 |     59 |     60 |
| 2023-03-25     |     2577 |               0 |                     0 | 12;18;22;31;44;50  |     12 |     18 |     22 |     31 |     44 |     50 |
| 2023-03-22     |     2576 |               0 |                     0 | 29;32;33;35;38;43  |     29 |     32 |     33 |     35 |     38 |     43 |
| 2023-03-18     |     2575 |               0 |                     0 | 4;12;14;41;46;53   |      4 |     12 |     14 |     41 |     46 |     53 |
| 2023-03-16     |     2574 |               0 |                     0 | 12;17;43;44;48;60  |     12 |     17 |     43 |     44 |     48 |     60 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2580 |                                  585 |                      0.23 |       23384931.2 |     289420865 |     348732.75 |                     15480 |                     53 |                      26 |
| Lotofácil     | 2003-09-29               |                  2782 |                                 2502 |                      0.90 |         898666.0 |       8252873 |      10712.22 |                     41730 |                     20 |                      16 |
| Quina         | 1994-03-13               |                  6119 |                                 2502 |                      0.41 |        3266461.0 |     579215957 |      14230.37 |                     30595 |                      4 |                      47 |
| Lotomania     | 1999-10-02               |                  2451 |                                  658 |                      0.27 |        2278331.5 |      37261930 |     109348.66 |                     49020 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  1920 |                                   70 |                      0.04 |       26972818.4 |     818652938 |     164711.44 |                     13440 |                     20 |                      53 |
| Super Sete    | 2020-10-02               |                   379 |                                   19 |                      0.05 |        2781923.9 |       8601548 |     124747.77 |                      2653 |                      9 |                       4 |
| Dia de Sorte  | 2018-05-19               |                   741 |                                  254 |                      0.34 |         787957.6 |       3770060 |      59101.35 |                      5187 |                     10 |                       1 |
