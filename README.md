
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
| 2022-12-03     |     2545 |               0 |                     0 | 20;23;32;36;39;57  |     20 |     23 |     32 |     36 |     39 |     57 |
| 2022-11-30     |     2544 |               0 |                     0 | 25;38;45;53;55;56  |     25 |     38 |     45 |     53 |     55 |     56 |
| 2022-11-26     |     2543 |               0 |                     0 | 2;5;27;30;46;53    |      2 |      5 |     27 |     30 |     46 |     53 |
| 2022-11-24     |     2542 |               0 |                     0 | 12;20;22;25;26;55  |     12 |     20 |     22 |     25 |     26 |     55 |
| 2022-11-22     |     2541 |               0 |                     0 | 10;28;45;47;57;59  |     10 |     28 |     45 |     47 |     57 |     59 |
| 2022-11-19     |     2540 |               0 |                     0 | 2;8;28;34;41;49    |      2 |      8 |     28 |     34 |     41 |     49 |
| 2022-11-16     |     2539 |               0 |                     0 | 1;23;32;33;36;59   |      1 |     23 |     32 |     33 |     36 |     59 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2545 |                                  578 |                      0.23 |       22947758.2 |     289420865 |     348732.75 |                     15270 |                     53 |                      26 |
| Lotofácil     | 2003-09-29               |                  2679 |                                 2410 |                      0.90 |         890961.8 |       8227507 |      10712.22 |                     40185 |                     20 |                       8 |
| Quina         | 1994-03-13               |                  6015 |                                 2480 |                      0.41 |        3247997.8 |     579215957 |      14230.37 |                     30075 |                      4 |                      47 |
| Lotomania     | 1999-10-02               |                  2399 |                                  650 |                      0.27 |        2247067.1 |      37261930 |     109348.66 |                     47980 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  1868 |                                   68 |                      0.04 |       27234282.4 |     818652938 |     164711.44 |                     13076 |                     20 |                      53 |
| Super Sete    | 2020-10-02               |                   327 |                                   18 |                      0.06 |        2458611.5 |       7786503 |     124747.77 |                      2289 |                      9 |                       1 |
| Dia de Sorte  | 2018-05-19               |                   689 |                                  241 |                      0.35 |         794984.0 |       3770060 |      59101.35 |                      4823 |                     10 |                       1 |
