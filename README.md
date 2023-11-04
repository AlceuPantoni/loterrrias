
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
| 2023-11-01     |     2651 |               1 |             104876676 | 6;23;35;36;37;59   |      6 |     23 |     35 |     36 |     37 |     59 |
| 2023-10-28     |     2650 |               0 |                     0 | 9;18;29;37;39;58   |      9 |     18 |     29 |     37 |     39 |     58 |
| 2023-10-26     |     2649 |               0 |                     0 | 6;11;26;32;46;56   |      6 |     11 |     26 |     32 |     46 |     56 |
| 2023-10-24     |     2648 |               0 |                     0 | 20;44;45;46;56;59  |     20 |     44 |     45 |     46 |     56 |     59 |
| 2023-10-21     |     2647 |               0 |                     0 | 9;33;39;43;50;54   |      9 |     33 |     39 |     43 |     50 |     54 |
| 2023-10-19     |     2646 |               0 |                     0 | 18;28;30;39;41;58  |     18 |     28 |     30 |     39 |     41 |     58 |
| 2023-10-17     |     2645 |               0 |                     0 | 8;22;34;42;51;59   |      8 |     22 |     34 |     42 |     51 |     59 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2651 |                                  599 |                      0.23 |       23897299.8 |     289420865 |     348732.75 |                     15906 |                     10 |                      26 |
| Lotofácil     | 2003-09-29               |                  2945 |                                 2632 |                      0.89 |         919548.3 |       8252873 |      10712.22 |                     44175 |                     20 |                      16 |
| Quina         | 1994-03-13               |                  6282 |                                 2527 |                      0.40 |        3340873.9 |     579215957 |      14230.37 |                     31410 |                      4 |                       3 |
| Lotomania     | 1999-10-02               |                  2542 |                                  668 |                      0.26 |        2350942.0 |      37261930 |     109348.66 |                     50840 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  2010 |                                   72 |                      0.04 |       26323286.7 |     818652938 |     164711.44 |                     14070 |                     20 |                      53 |
| Super Sete    | 2020-10-02               |                   467 |                                   21 |                      0.04 |        3390765.6 |      10146164 |     124747.77 |                      3269 |                      9 |                       4 |
| Dia de Sorte  | 2018-05-19               |                   831 |                                  274 |                      0.33 |         790878.2 |       3770060 |      59101.35 |                      5817 |                     17 |                       1 |
