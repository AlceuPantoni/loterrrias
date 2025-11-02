
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
| 2025-11-01    |     2935 |              0 |                   0 | 9;18;28;34;38;57  |     9 |    18 |    28 |    34 |    38 |    57 |
| 2025-10-30    |     2934 |              0 |                   0 | 9;17;23;26;33;59  |     9 |    17 |    23 |    26 |    33 |    59 |
| 2025-10-28    |     2933 |              0 |                   0 | 1;18;22;42;48;50  |     1 |    18 |    22 |    42 |    48 |    50 |
| 2025-10-25    |     2932 |              1 |            96166949 | 4;13;25;36;40;53  |     4 |    13 |    25 |    36 |    40 |    53 |
| 2025-10-23    |     2931 |              0 |                   0 | 4;19;23;36;47;52  |     4 |    19 |    23 |    36 |    47 |    52 |
| 2025-10-21    |     2930 |              0 |                   0 | 1;11;13;14;36;45  |     1 |    11 |    13 |    14 |    36 |    45 |
| 2025-10-18    |     2929 |              0 |                   0 | 3;7;8;34;35;51    |     3 |     7 |     8 |    34 |    35 |    51 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2935 |                               643 |                    0.22 |      26539760.6 |    289420865 |    348732.75 |                   17610 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3528 |                              3112 |                    0.88 |        984047.9 |      8252873 |     10712.22 |                   52920 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6868 |                              2613 |                    0.38 |       3596486.8 |    579215957 |     14230.37 |                   34340 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2843 |                               703 |                    0.25 |       2570998.3 |     37261930 |    109348.66 |                   56860 |                   47 |                    96 |
| Timemania    | 2008-03-01             |                 2315 |                                78 |                    0.03 |      25486153.3 |    818652938 |    164711.44 |                   16205 |                   20 |                    53 |
| Super Sete   | 2020-10-02             |                  766 |                                30 |                    0.04 |       3168014.8 |     10146164 |    124747.77 |                    5362 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1136 |                               349 |                    0.31 |        827161.0 |      4872572 |     59101.35 |                    7952 |                   10 |                     1 |
