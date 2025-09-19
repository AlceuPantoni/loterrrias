
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
| 2025-09-18    |     2916 |              0 |                   0 | 5;11;16;27;40;45  |     5 |    11 |    16 |    27 |    40 |    45 |
| 2025-09-16    |     2915 |              0 |                   0 | 10;11;15;38;52;60 |    10 |    11 |    15 |    38 |    52 |    60 |
| 2025-09-13    |     2914 |              0 |                   0 | 18;25;35;40;46;47 |    18 |    25 |    35 |    40 |    46 |    47 |
| 2025-09-11    |     2913 |              1 |            53944790 | 17;21;34;52;55;60 |    17 |    21 |    34 |    52 |    55 |    60 |
| 2025-09-09    |     2912 |              0 |                   0 | 9;25;37;41;51;59  |     9 |    25 |    37 |    41 |    51 |    59 |
| 2025-09-06    |     2911 |              0 |                   0 | 23;27;32;54;56;59 |    23 |    27 |    32 |    54 |    56 |    59 |
| 2025-09-04    |     2910 |              0 |                   0 | 3;4;11;15;28;29   |     3 |     4 |    11 |    15 |    28 |    29 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2916 |                               640 |                    0.22 |      26359821.9 |    289420865 |    348732.75 |                   17496 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3490 |                              3081 |                    0.88 |        979599.5 |      8252873 |     10712.22 |                   52350 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6830 |                              2609 |                    0.38 |       3579437.8 |    579215957 |     14230.37 |                   34150 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2824 |                               701 |                    0.25 |       2562514.4 |     37261930 |    109348.66 |                   56480 |                   47 |                    96 |
| Timemania    | 2008-03-01             |                 2296 |                                78 |                    0.03 |      25486153.3 |    818652938 |    164711.44 |                   16072 |                   20 |                    53 |
| Super Sete   | 2020-10-02             |                  747 |                                30 |                    0.04 |       3168014.8 |     10146164 |    124747.77 |                    5229 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1117 |                               347 |                    0.31 |        812187.3 |      4872572 |     59101.35 |                    7819 |                   10 |                     1 |
