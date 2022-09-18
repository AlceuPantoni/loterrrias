
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Pacote Loterrrias <img src="man/figures/logo.png" align="right" height="139" />

<!-- badges: start -->

[![R-CMD-Check](https://github.com/AlceuPantoni/loterrrias/actions/workflows/R-CMD-check.yaml/badge.svg?branch=main)](https://github.com/AlceuPantoni/loterrrias/actions/workflows/R-CMD-check.yaml)
[![update-data](https://github.com/AlceuPantoni/loterrrias/actions/workflows/update-data.yaml/badge.svg)](https://github.com/AlceuPantoni/loterrrias/actions/workflows/update-data.yaml)
[![test-coverage](https://github.com/AlceuPantoni/loterrrias/actions/workflows/test-coverage.yaml/badge.svg?branch=main)](https://github.com/AlceuPantoni/loterrrias/actions/workflows/test-coverage.yaml)
[![Codecov test
coverage](https://codecov.io/gh/AlceuPantoni/loterrrias/branch/main/graph/badge.svg)](https://codecov.io/gh/AlceuPantoni/loterrrias?branch=main)
<!-- badges: end -->

Este pacote tem por objetivo disponilizar os dados dos produtos das
Loterias do Caixa.

Os dados foram obtidos diretamente do site das
[Loterias](https://loterias.caixa.gov.br/Paginas/default.aspx) da
[Caixa](https://www.caixa.gov.br/Paginas/home-caixa.aspx) através do uso
de técnicas de Web Scraping.

Caso necessário, é possível fazer download das base de dados em formado
**xlsx** através dos links abaixo:

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
| 2022-09-17     |     2521 |               1 |                     0 | 23;28;33;38;55;59  |     23 |     28 |     33 |     38 |     55 |     59 |
| 2022-09-15     |     2520 |               1 |                     0 | 2;17;22;41;58;60   |      2 |     17 |     22 |     41 |     58 |     60 |
| 2022-09-13     |     2519 |               0 |                     0 | 3;8;20;36;38;57    |      3 |      8 |     20 |     36 |     38 |     57 |
| 2022-09-10     |     2518 |               0 |                     0 | 3;22;23;44;53;60   |      3 |     22 |     23 |     44 |     53 |     60 |
| 2022-09-08     |     2517 |               0 |                     0 | 1;5;6;16;22;39     |      1 |      5 |      6 |     16 |     22 |     39 |
| 2022-09-03     |     2516 |               0 |                     0 | 8;17;49;51;52;53   |      8 |     17 |     49 |     51 |     52 |     53 |
| 2022-08-31     |     2515 |               0 |                     0 | 3;12;19;41;45;54   |      3 |     12 |     19 |     41 |     45 |     54 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2521 |                                  577 |                      0.23 |       22372720.7 |     289420865 |             0 |                     15126 |                     53 |                      26 |
| Lotofácil     | 2003-09-29               |                  2616 |                                 2354 |                      0.90 |         887831.9 |       8227507 |             0 |                     39240 |                     20 |                       8 |
| Quina         | 1994-03-13               |                  5952 |                                 2474 |                      0.42 |        3227562.9 |     579215957 |             0 |                     29760 |                      4 |                      47 |
| Lotomania     | 1999-10-02               |                  2366 |                                  644 |                      0.27 |        2240352.4 |      37261930 |             0 |                     47320 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  1836 |                                   70 |                      0.04 |       26456160.1 |     818652938 |             0 |                     12852 |                     21 |                      53 |
| Super Sete    | 2020-10-02               |                   296 |                                   20 |                      0.07 |        2212750.3 |       7786503 |             0 |                      2072 |                      9 |                       1 |
| Dia de Sorte  | 2018-05-19               |                   657 |                                  230 |                      0.35 |         813559.5 |       3770060 |             0 |                      4599 |                     10 |                       1 |
