
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
| 2023-02-25     |     2568 |               0 |                     0 | 16;22;29;35;38;49  |     16 |     22 |     29 |     35 |     38 |     49 |
| 2023-02-23     |     2567 |               1 |               8548141 | 10;11;19;33;58;60  |     10 |     11 |     19 |     33 |     58 |     60 |
| 2023-02-18     |     2566 |               0 |                     0 | 11;23;45;53;57;59  |     11 |     23 |     45 |     53 |     57 |     59 |
| 2023-02-16     |     2565 |               1 |              17626626 | 9;13;25;39;46;54   |      9 |     13 |     25 |     39 |     46 |     54 |
| 2023-02-14     |     2564 |               0 |                     0 | 7;8;14;19;32;45    |      7 |      8 |     14 |     19 |     32 |     45 |
| 2023-02-11     |     2563 |               0 |                     0 | 5;9;14;30;38;50    |      5 |      9 |     14 |     30 |     38 |     50 |
| 2023-02-08     |     2562 |               1 |              76403944 | 6;12;32;44;51;57   |      6 |     12 |     32 |     44 |     51 |     57 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome\_produto | data\_primeiro\_concurso | quantidade\_concursos | quantidade\_concursos\_com\_ganhador | percentual\_com\_ganhador | media\_premiacao | maior\_premio | menor\_premio | total\_dezenas\_sorteadas | numero\_mais\_sorteado | numero\_menos\_sorteado |
| :------------ | :----------------------- | --------------------: | -----------------------------------: | ------------------------: | ---------------: | ------------: | ------------: | ------------------------: | ---------------------: | ----------------------: |
| Mega-sena     | 1996-03-11               |                  2568 |                                  583 |                      0.23 |       23344062.0 |     289420865 |     348732.75 |                     15408 |                     53 |                      26 |
| Lotofácil     | 2003-09-29               |                  2749 |                                 2473 |                      0.90 |         897393.8 |       8252873 |      10712.22 |                     41235 |                     20 |                      16 |
| Quina         | 1994-03-13               |                  6086 |                                 2496 |                      0.41 |        3261361.2 |     579215957 |      14230.37 |                     30430 |                      4 |                      47 |
| Lotomania     | 1999-10-02               |                  2435 |                                  654 |                      0.27 |        2270033.7 |      37261930 |     109348.66 |                     48700 |                     47 |                      96 |
| Timemania     | 2008-03-01               |                  1903 |                                   69 |                      0.04 |       27261125.1 |     818652938 |     164711.44 |                     13321 |                     20 |                      53 |
| Super Sete    | 2020-10-02               |                   363 |                                   19 |                      0.05 |        2781923.9 |       8601548 |     124747.77 |                      2541 |                      9 |                       4 |
| Dia de Sorte  | 2018-05-19               |                   724 |                                  247 |                      0.34 |         799514.9 |       3770060 |      59101.35 |                      5068 |                     10 |                       1 |
