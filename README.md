
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
| 2025-10-09    |     2925 |              0 |                   0 | 7;9;12;13;24;27   |     7 |     9 |    12 |    13 |    24 |    27 |
| 2025-10-07    |     2924 |              1 |            17924307 | 10;19;30;40;48;54 |    10 |    19 |    30 |    40 |    48 |    54 |
| 2025-10-04    |     2923 |              0 |                   0 | 18;27;32;39;55;56 |    18 |    27 |    32 |    39 |    55 |    56 |
| 2025-10-02    |     2922 |              0 |                   0 | 4;23;30;39;40;41  |     4 |    23 |    30 |    39 |    40 |    41 |
| 2025-09-30    |     2921 |              0 |                   0 | 9;12;14;16;26;36  |     9 |    12 |    14 |    16 |    26 |    36 |
| 2025-09-27    |     2920 |              1 |            80688744 | 8;12;16;19;31;58  |     8 |    12 |    16 |    19 |    31 |    58 |
| 2025-09-25    |     2919 |              0 |                   0 | 3;26;28;37;42;53  |     3 |    26 |    28 |    37 |    42 |    53 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2925 |                               642 |                    0.22 |      26431307.0 |    289420865 |    348732.75 |                   17550 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3509 |                              3098 |                    0.88 |        979977.5 |      8252873 |     10712.22 |                   52635 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6849 |                              2611 |                    0.38 |       3591120.5 |    579215957 |     14230.37 |                   34245 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2834 |                               703 |                    0.25 |       2570998.3 |     37261930 |    109348.66 |                   56680 |                   47 |                    96 |
| Timemania    | 2008-03-01             |                 2305 |                                78 |                    0.03 |      25486153.3 |    818652938 |    164711.44 |                   16135 |                   20 |                    53 |
| Super Sete   | 2020-10-02             |                  757 |                                30 |                    0.04 |       3168014.8 |     10146164 |    124747.77 |                    5299 |                    7 |                     8 |
| Dia de Sorte | 2018-05-19             |                 1126 |                               348 |                    0.31 |        815854.4 |      4872572 |     59101.35 |                    7882 |                   10 |                     1 |
