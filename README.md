
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
| 2026-05-16 | 3009 | 0 | 0 | 4;6;8;18;21;30 | 4 | 6 | 8 | 18 | 21 | 30 |
| 2026-05-14 | 3008 | 0 | 0 | 11;12;14;20;42;44 | 11 | 12 | 14 | 20 | 42 | 44 |
| 2026-05-12 | 3007 | 0 | 0 | 17;19;27;32;38;44 | 17 | 19 | 27 | 32 | 38 | 44 |
| 2026-05-09 | 3006 | 0 | 0 | 25;42;45;48;50;60 | 25 | 42 | 45 | 48 | 50 | 60 |
| 2026-05-07 | 3005 | 0 | 0 | 17;23;29;30;48;50 | 17 | 23 | 29 | 30 | 48 | 50 |
| 2026-05-05 | 3004 | 0 | 0 | 1;5;7;22;50;59 | 1 | 5 | 7 | 22 | 50 | 59 |
| 2026-05-02 | 3003 | 0 | 0 | 8;24;27;37;47;55 | 8 | 24 | 27 | 37 | 47 | 55 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:---|:---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Mega-sena | 1996-03-11 | 3009 | 652 | 0.22 | 27435591.1 | 289420865 | 348732.75 | 18054 | 10 | 26 |
| Lotofácil | 2003-09-29 | 3692 | 3240 | 0.88 | 1001871.5 | 8252873 | 10712.22 | 55380 | 20 | 16 |
| Quina | 1994-03-13 | 7032 | 2638 | 0.38 | 3646533.5 | 579215957 | 14230.37 | 35160 | 4 | 47 |
| Lotomania | 1999-10-02 | 2927 | 712 | 0.24 | 2612051.5 | 37261930 | 109348.66 | 58540 | 43 | 96 |
| Timemania | 2008-03-01 | 2394 | 79 | 0.03 | 26090570.6 | 818652938 | 164711.44 | 16758 | 21 | 53 |
| Super Sete | 2020-10-02 | 850 | 33 | 0.04 | 3300658.6 | 10146164 | 124747.77 | 5950 | 7 | 8 |
| Dia de Sorte | 2018-05-19 | 1216 | 367 | 0.30 | 842573.9 | 4872572 | 59101.35 | 8512 | 10 | 1 |
