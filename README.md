
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
|:---|---:|---:|---:|:---|---:|---:|---:|---:|---:|---:|
| 2026-11-10 | 3084 | 1 | 3287950 | 6;14;22;30;31;37 | 6 | 14 | 22 | 30 | 31 | 37 |
| 2026-11-08 | 3083 | 1 | 59526904 | 22;25;29;37;46;54 | 22 | 25 | 29 | 37 | 46 | 54 |
| 2026-11-06 | 3082 | 0 | 0 | 4;16;23;24;38;44 | 4 | 16 | 23 | 24 | 38 | 44 |
| 2026-11-04 | 3081 | 0 | 0 | 10;17;42;43;57;59 | 10 | 17 | 42 | 43 | 57 | 59 |
| 2026-11-01 | 3080 | 0 | 0 | 13;17;28;29;39;58 | 13 | 17 | 28 | 29 | 39 | 58 |
| 2026-10-30 | 3079 | 0 | 0 | 5;9;16;40;41;59 | 5 | 9 | 16 | 40 | 41 | 59 |
| 2026-10-29 | 3078 | 0 | 0 | 5;7;12;29;34;36 | 5 | 7 | 12 | 29 | 34 | 36 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:---|:---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Mega-sena | 1996-03-11 | 3084 | 664 | 0.22 | 28444018.4 | 324898792 | 348732.75 | 18504 | 10 | 26 |
| Lotofácil | 2003-09-29 | 3826 | 3333 | 0.87 | 1021738.5 | 14264457 | 10712.22 | 57390 | 20 | 16 |
| Quina | 1994-03-13 | 7164 | 2651 | 0.37 | 3700279.7 | 579215957 | 14230.37 | 35820 | 4 | 47 |
| Lotomania | 1999-10-02 | 2997 | 723 | 0.24 | 2653946.4 | 37261930 | 109348.66 | 59940 | 43 | 96 |
| Timemania | 2008-03-01 | 2466 | 80 | 0.03 | 26191777.3 | 818652938 | 164711.44 | 17262 | 21 | 53 |
| Super Sete | 2020-10-02 | 910 | 33 | 0.04 | 3300658.6 | 10146164 | 124747.77 | 6370 | 5 | 8 |
| Dia de Sorte | 2018-05-19 | 1344 | 391 | 0.29 | 845547.3 | 4872572 | 59101.35 | 9408 | 10 | 1 |
