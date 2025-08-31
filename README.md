
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
  [Dia_de_Sorte`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_diadesorte.xlsx)
- ***Lotofácil***
  [Lotofacil`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_lotofacil.xlsx)
- ***Lotomania***
  [Lotomania`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_lotomania.xlsx)
- ***Mega-Sena***
  [Mega_Sena`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_megasena.xlsx)
- ***Quina***
  [Quina`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_quina.xlsx)
- ***Super Sete***
  [Super_Sete`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_supersete.xlsx)
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

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | numeros_sorteados | num_1 | num_2 | num_3 | num_4 | num_5 | num_6 |
|:--------------|---------:|---------------:|--------------------:|:------------------|------:|------:|------:|------:|------:|------:|
| 2025-08-30    |     2908 |              0 |                   0 | 20;35;36;37;38;50 |    20 |    35 |    36 |    37 |    38 |    50 |
| 2025-08-28    |     2907 |              0 |                   0 | 30;33;42;44;52;56 |    30 |    33 |    42 |    44 |    52 |    56 |
| 2025-08-26    |     2906 |              1 |            33707841 | 17;33;37;41;46;49 |    17 |    33 |    37 |    41 |    46 |    49 |
| 2025-08-23    |     2905 |              0 |                   0 | 4;17;18;26;43;52  |     4 |    17 |    18 |    26 |    43 |    52 |
| 2025-08-21    |     2904 |              0 |                   0 | 2;37;38;46;52;55  |     2 |    37 |    38 |    46 |    52 |    55 |
| 2025-08-19    |     2903 |              1 |            63090151 | 20;24;27;46;50;54 |    20 |    24 |    27 |    46 |    50 |    54 |
| 2025-08-16    |     2902 |              0 |                   0 | 8;21;22;42;45;48  |     8 |    21 |    22 |    42 |    45 |    48 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2908 |                               639 |                    0.22 |      26316653.0 |    289420865 |    348732.75 |                   17448 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3479 |                              3071 |                    0.88 |        976716.6 |      8252873 |     10712.22 |                   52185 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6814 |                              2606 |                    0.38 |       3573793.8 |    579215957 |     14230.37 |                   34070 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2816 |                               700 |                    0.25 |       2560582.7 |     37261930 |    109348.66 |                   56320 |                   47 |                    96 |
| Timemania    | 2008-03-01             |                 2288 |                                78 |                    0.03 |      25486153.3 |    818652938 |    164711.44 |                   16016 |                   20 |                    53 |
| Super Sete   | 2020-10-02             |                  739 |                                30 |                    0.04 |       3168014.8 |     10146164 |    124747.77 |                    5173 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1109 |                               345 |                    0.31 |        813004.8 |      4872572 |     59101.35 |                    7763 |                   10 |                     1 |
