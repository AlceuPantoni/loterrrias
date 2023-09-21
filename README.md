
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
| 2023-09-19     |     2634 |               0 |                     0 | 8;27;28;32;48;56   |      8 |     27 |     28 |     32 |     48 |     56 |
| 2023-09-16     |     2633 |               0 |                     0 | 2;23;25;33;45;54   |      2 |     23 |     25 |     33 |     45 |     54 |
| 2023-09-14     |     2632 |               0 |                     0 | 5;10;27;38;56;57   |      5 |     10 |     27 |     38 |     56 |     57 |
| 2023-09-12     |     2631 |               0 |                     0 | 14;26;36;39;50;53  |     14 |     26 |     36 |     39 |     50 |     53 |
| 2023-09-09     |     2630 |               1 |              84729015 | 14;18;22;26;31;38  |     14 |     18 |     22 |     26 |     31 |     38 |
| 2023-09-05     |     2629 |               0 |                     0 | 11;32;35;40;41;48  |     11 |     32 |     35 |     40 |     41 |     48 |
| 2023-09-02     |     2628 |               0 |                     0 | 5;14;32;40;53;54   |      5 |     14 |     32 |     40 |     53 |     54 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2634 |                                  596 |                      0.23 |       23718835.9 |     289420865 |     348732.75 |                     15804 |                     10 |                      26 |
| Lotofácil     | 2003-09-29               |                  2908 |                                 2603 |                      0.90 |         913305.8 |       8252873 |      10712.22 |                     43620 |                     20 |                      16 |
| Quina         | 1994-03-13               |                  6246 |                                 2522 |                      0.40 |        3331788.8 |     579215957 |      14230.37 |                     31230 |                      4 |                       3 |
| Lotomania     | 1999-10-02               |                  2523 |                                  665 |                      0.26 |        2345343.4 |      37261930 |     109348.66 |                     50460 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  1991 |                                   72 |                      0.04 |       26323286.7 |     818652938 |     164711.44 |                     13937 |                     20 |                      53 |
| Super Sete    | 2020-10-02               |                   448 |                                   20 |                      0.04 |        3150135.9 |      10146164 |     124747.77 |                      3136 |                      9 |                       4 |
| Dia de Sorte  | 2018-05-19               |                   812 |                                  268 |                      0.33 |         791765.0 |       3770060 |      59101.35 |                      5684 |                     10 |                       1 |
