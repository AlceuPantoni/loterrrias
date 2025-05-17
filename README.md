
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
| 2025-05-15    |     2863 |              0 |                   0 | 5;23;32;34;47;56  |     5 |    23 |    32 |    34 |    47 |    56 |
| 2025-05-13    |     2862 |              0 |                   0 | 2;4;14;18;22;44   |     2 |     4 |    14 |    18 |    22 |    44 |
| 2025-05-10    |     2861 |              0 |                   0 | 2;21;27;46;51;53  |     2 |    21 |    27 |    46 |    51 |    53 |
| 2025-05-08    |     2860 |              0 |                   0 | 2;5;17;24;38;57   |     2 |     5 |    17 |    24 |    38 |    57 |
| 2025-05-06    |     2859 |              0 |                   0 | 7;8;15;17;20;51   |     7 |     8 |    15 |    17 |    20 |    51 |
| 2025-05-03    |     2858 |              0 |                   0 | 8;18;27;28;48;52  |     8 |    18 |    27 |    28 |    48 |    52 |
| 2025-04-29    |     2857 |              0 |                   0 | 2;18;28;38;41;50  |     2 |    18 |    28 |    38 |    41 |    50 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2863 |                               631 |                    0.22 |      25899799.9 |    289420865 |    348732.75 |                   17178 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3393 |                              3002 |                    0.88 |        964748.2 |      8252873 |     10712.22 |                   50895 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6731 |                              2591 |                    0.38 |       3548700.4 |    579215957 |     14230.37 |                   33655 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2771 |                               694 |                    0.25 |       2517249.1 |     37261930 |    109348.66 |                   55420 |                   47 |                    96 |
| Timemania    | 2008-03-01             |                 2243 |                                78 |                    0.03 |      25486153.3 |    818652938 |    164711.44 |                   15701 |                   20 |                    53 |
| Super Sete   | 2020-10-02             |                  694 |                                29 |                    0.04 |       3086601.8 |     10146164 |    124747.77 |                    4858 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1064 |                               330 |                    0.31 |        819786.3 |      4872572 |     59101.35 |                    7448 |                   10 |                     1 |
