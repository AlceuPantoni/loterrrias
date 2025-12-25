
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
| 2025-12-20    |     2954 |              0 |                   0 | 1;9;37;39;42;44   |     1 |     9 |    37 |    39 |    42 |    44 |
| 2025-12-18    |     2953 |              0 |                   0 | 5;10;24;25;47;54  |     5 |    10 |    24 |    25 |    47 |    54 |
| 2025-12-16    |     2952 |              0 |                   0 | 1;20;45;48;51;58  |     1 |    20 |    45 |    48 |    51 |    58 |
| 2025-12-13    |     2951 |              0 |                   0 | 5;8;30;31;37;45   |     5 |     8 |    30 |    31 |    37 |    45 |
| 2025-12-11    |     2950 |              0 |                   0 | 21;23;42;49;50;60 |    21 |    23 |    42 |    49 |    50 |    60 |
| 2025-12-09    |     2949 |              0 |                   0 | 4;6;11;38;49;54   |     4 |     6 |    11 |    38 |    49 |    54 |
| 2025-12-06    |     2948 |              0 |                   0 | 6;24;37;52;53;58  |     6 |    24 |    37 |    52 |    53 |    58 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2954 |                               646 |                    0.22 |      26635249.7 |    289420865 |    348732.75 |                   17724 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3571 |                              3145 |                    0.88 |        986128.1 |      8252873 |     10712.22 |                   53565 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6911 |                              2621 |                    0.38 |       3602397.8 |    579215957 |     14230.37 |                   34555 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2866 |                               706 |                    0.25 |       2580335.9 |     37261930 |    109348.66 |                   57320 |                   43 |                    96 |
| Timemania    | 2008-03-01             |                 2335 |                                78 |                    0.03 |      25486153.3 |    818652938 |    164711.44 |                   16345 |                   20 |                    53 |
| Super Sete   | 2020-10-02             |                  789 |                                32 |                    0.04 |       3179529.6 |     10146164 |    124747.77 |                    5523 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1156 |                               355 |                    0.31 |        833186.5 |      4872572 |     59101.35 |                    8092 |                   10 |                     1 |
