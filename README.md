
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
| 2023-10-07     |     2642 |               0 |                     0 | 8;13;31;33;49;50   |      8 |     13 |     31 |     33 |     49 |     50 |
| 2023-10-05     |     2641 |               1 |              32744243 | 9;24;34;39;45;50   |      9 |     24 |     34 |     39 |     45 |     50 |
| 2023-10-03     |     2640 |               0 |                     0 | 4;8;10;27;28;32    |      4 |      8 |     10 |     27 |     28 |     32 |
| 2023-09-30     |     2639 |               0 |                     0 | 2;8;11;22;48;49    |      2 |      8 |     11 |     22 |     48 |     49 |
| 2023-09-28     |     2638 |               0 |                     0 | 9;30;34;44;54;55   |      9 |     30 |     34 |     44 |     54 |     55 |
| 2023-09-26     |     2637 |               0 |                     0 | 1;2;10;32;34;59    |      1 |      2 |     10 |     32 |     34 |     59 |
| 2023-09-23     |     2636 |               1 |              40435445 | 5;16;38;42;43;48   |      5 |     16 |     38 |     42 |     43 |     48 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2642 |                                  598 |                      0.23 |       23761882.8 |     289420865 |     348732.75 |                     15852 |                     10 |                      26 |
| Lotofácil     | 2003-09-29               |                  2924 |                                 2614 |                      0.89 |         915422.4 |       8252873 |      10712.22 |                     43860 |                     20 |                      16 |
| Quina         | 1994-03-13               |                  6261 |                                 2523 |                      0.40 |        3333957.5 |     579215957 |      14230.37 |                     31305 |                      4 |                       3 |
| Lotomania     | 1999-10-02               |                  2530 |                                  667 |                      0.26 |        2344965.0 |      37261930 |     109348.66 |                     50600 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  1999 |                                   72 |                      0.04 |       26323286.7 |     818652938 |     164711.44 |                     13993 |                     20 |                      53 |
| Super Sete    | 2020-10-02               |                   455 |                                   20 |                      0.04 |        3150135.9 |      10146164 |     124747.77 |                      3185 |                      9 |                       4 |
| Dia de Sorte  | 2018-05-19               |                   820 |                                  272 |                      0.33 |         791962.1 |       3770060 |      59101.35 |                      5740 |                     10 |                       1 |
