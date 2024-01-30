
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
| 2024-01-27     |     2681 |               0 |                     0 | 10;20;30;42;47;53  |     10 |     20 |     30 |     42 |     47 |     53 |
| 2024-01-25     |     2680 |               0 |                     0 | 3;11;42;45;46;57   |      3 |     11 |     42 |     45 |     46 |     57 |
| 2024-01-23     |     2679 |               0 |                     0 | 7;18;20;26;38;51   |      7 |     18 |     20 |     26 |     38 |     51 |
| 2024-01-20     |     2678 |               0 |                     0 | 10;13;16;18;37;54  |     10 |     13 |     16 |     18 |     37 |     54 |
| 2024-01-18     |     2677 |               0 |                     0 | 3;7;32;34;42;54    |      3 |      7 |     32 |     34 |     42 |     54 |
| 2024-01-16     |     2676 |               0 |                     0 | 4;6;14;19;22;29    |      4 |      6 |     14 |     19 |     22 |     29 |
| 2024-01-13     |     2675 |               0 |                     0 | 1;26;31;34;42;45   |      1 |     26 |     31 |     34 |     42 |     45 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2681 |                                  605 |                      0.23 |       24078562.3 |     289420865 |     348732.75 |                     16086 |                     10 |                      55 |
| Lotofácil     | 2003-09-29               |                  3016 |                                 2689 |                      0.89 |         927297.9 |       8252873 |      10712.22 |                     45240 |                     20 |                      16 |
| Quina         | 1994-03-13               |                  6353 |                                 2540 |                      0.40 |        3367478.7 |     579215957 |      14230.37 |                     31765 |                      4 |                       3 |
| Lotomania     | 1999-10-02               |                  2578 |                                  671 |                      0.26 |        2384090.2 |      37261930 |     109348.66 |                     51560 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  2047 |                                   73 |                      0.04 |       26295353.9 |     818652938 |     164711.44 |                     14329 |                     20 |                      53 |
| Super Sete    | 2020-10-02               |                   501 |                                   22 |                      0.04 |        3337346.2 |      10146164 |     124747.77 |                      3507 |                      9 |                       8 |
| Dia de Sorte  | 2018-05-19               |                   868 |                                  279 |                      0.32 |         817509.4 |       4872572 |      59101.35 |                      6076 |                     10 |                       1 |
