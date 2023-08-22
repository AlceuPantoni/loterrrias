
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
| 2023-08-19     |     2622 |               1 |               4645727 | 9;19;22;24;50;60   |      9 |     19 |     22 |     24 |     50 |     60 |
| 2023-08-16     |     2621 |               1 |               1928029 | 6;9;14;16;42;47    |      6 |      9 |     14 |     16 |     42 |     47 |
| 2023-08-12     |     2620 |               1 |              29058128 | 4;6;13;21;26;28    |      4 |      6 |     13 |     21 |     26 |     28 |
| 2023-08-09     |     2619 |               0 |                     0 | 5;36;39;41;44;50   |      5 |     36 |     39 |     41 |     44 |     50 |
| 2023-08-05     |     2618 |               0 |                     0 | 6;17;29;35;45;48   |      6 |     17 |     29 |     35 |     45 |     48 |
| 2023-08-02     |     2617 |               0 |                     0 | 3;14;36;42;43;44   |      3 |     14 |     36 |     42 |     43 |     44 |
| 2023-07-29     |     2616 |               0 |                     0 | 6;16;23;35;38;49   |      6 |     16 |     23 |     35 |     38 |     49 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2622 |                                  595 |                      0.23 |         23616298 |     289420865 |     348732.75 |                     15732 |                     10 |                      26 |
| Lotofácil     | 2003-09-29               |                  2895 |                                 2592 |                      0.90 |           911200 |       8252873 |      10712.22 |                     43425 |                     20 |                      16 |
| Quina         | 1994-03-13               |                  6221 |                                 2518 |                      0.40 |          3321653 |     579215957 |      14230.37 |                     31105 |                      4 |                       3 |
| Lotomania     | 1999-10-02               |                  2510 |                                  664 |                      0.26 |          2332863 |      37261930 |     109348.66 |                     50200 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  1978 |                                   72 |                      0.04 |         26323287 |     818652938 |     164711.44 |                     13846 |                     20 |                      53 |
| Super Sete    | 2020-10-02               |                   435 |                                   20 |                      0.05 |          3150136 |      10146164 |     124747.77 |                      3045 |                      9 |                       4 |
| Dia de Sorte  | 2018-05-19               |                   799 |                                  268 |                      0.34 |           791765 |       3770060 |      59101.35 |                      5593 |                     10 |                       1 |
