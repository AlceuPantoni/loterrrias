
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
| 2023-12-05     |     2664 |               0 |                     0 | 12;15;17;30;40;52  |     12 |     15 |     17 |     30 |     40 |     52 |
| 2023-12-02     |     2663 |               0 |                     0 | 7;11;27;41;56;59   |      7 |     11 |     27 |     41 |     56 |     59 |
| 2023-11-30     |     2662 |               1 |              35852142 | 17;20;31;34;40;42  |     17 |     20 |     31 |     34 |     40 |     42 |
| 2023-11-28     |     2661 |               0 |                     0 | 6;30;35;38;41;56   |      6 |     30 |     35 |     38 |     41 |     56 |
| 2023-11-25     |     2660 |               0 |                     0 | 6;12;13;20;38;60   |      6 |     12 |     13 |     20 |     38 |     60 |
| 2023-11-23     |     2659 |               0 |                     0 | 11;36;46;53;55;60  |     11 |     36 |     46 |     53 |     55 |     60 |
| 2023-11-21     |     2658 |               1 |              50248574 | 5;13;39;51;58;60   |      5 |     13 |     39 |     51 |     58 |     60 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2664 |                                  602 |                      0.23 |       23941013.6 |     289420865 |     348732.75 |                     15984 |                     10 |                      21 |
| Lotofácil     | 2003-09-29               |                  2972 |                                 2655 |                      0.89 |         920338.6 |       8252873 |      10712.22 |                     44580 |                     20 |                      16 |
| Quina         | 1994-03-13               |                  6309 |                                 2533 |                      0.40 |        3346566.6 |     579215957 |      14230.37 |                     31545 |                      4 |                       3 |
| Lotomania     | 1999-10-02               |                  2556 |                                  669 |                      0.26 |        2358451.5 |      37261930 |     109348.66 |                     51120 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  2024 |                                   73 |                      0.04 |       26295353.9 |     818652938 |     164711.44 |                     14168 |                     20 |                      53 |
| Super Sete    | 2020-10-02               |                   480 |                                   21 |                      0.04 |        3390765.6 |      10146164 |     124747.77 |                      3360 |                      9 |                       4 |
| Dia de Sorte  | 2018-05-19               |                   845 |                                  275 |                      0.33 |         804594.8 |       4562937 |      59101.35 |                      5915 |                     10 |                       1 |
