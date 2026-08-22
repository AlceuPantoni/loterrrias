
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
| 2026-08-20 | 3047 | 0 | 0 | 4;18;22;26;31;58 | 4 | 18 | 22 | 26 | 31 | 58 |
| 2026-08-18 | 3046 | 0 | 0 | 16;23;24;33;36;52 | 16 | 23 | 24 | 33 | 36 | 52 |
| 2026-08-16 | 3045 | 0 | 0 | 23;29;33;42;43;57 | 23 | 29 | 33 | 42 | 43 | 57 |
| 2026-08-13 | 3044 | 0 | 0 | 4;15;17;40;55;58 | 4 | 15 | 17 | 40 | 55 | 58 |
| 2026-08-11 | 3043 | 1 | 3077413 | 10;11;16;37;42;53 | 10 | 11 | 16 | 37 | 42 | 53 |
| 2026-08-09 | 3042 | 1 | 164895646 | 2;5;10;35;40;53 | 2 | 5 | 10 | 35 | 40 | 53 |
| 2026-08-06 | 3041 | 0 | 0 | 16;21;24;31;43;54 | 16 | 21 | 24 | 31 | 43 | 54 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:---|:---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Mega-sena | 1996-03-11 | 3047 | 659 | 0.22 | 27829866.9 | 289420865 | 348732.75 | 18282 | 10 | 26 |
| Lotofácil | 2003-09-29 | 3768 | 3291 | 0.87 | 1011480.8 | 14264457 | 10712.22 | 56520 | 20 | 16 |
| Quina | 1994-03-13 | 7098 | 2645 | 0.37 | 3678617.2 | 579215957 | 14230.37 | 35490 | 4 | 47 |
| Lotomania | 1999-10-02 | 2966 | 719 | 0.24 | 2617649.3 | 37261930 | 109348.66 | 59320 | 43 | 96 |
| Timemania | 2008-03-01 | 2431 | 80 | 0.03 | 26191777.3 | 818652938 | 164711.44 | 17017 | 21 | 53 |
| Super Sete | 2020-10-02 | 889 | 33 | 0.04 | 3300658.6 | 10146164 | 124747.77 | 6223 | 5 | 8 |
| Dia de Sorte | 2018-05-19 | 1278 | 380 | 0.30 | 835178.9 | 4872572 | 59101.35 | 8946 | 10 | 1 |
