
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
| 2026-06-30 | 3025 | 0 | 0 | 7;14;16;21;33;58 | 7 | 14 | 16 | 21 | 33 | 58 |
| 2026-06-27 | 3024 | 0 | 0 | 13;39;42;44;47;49 | 13 | 39 | 42 | 44 | 47 | 49 |
| 2026-06-25 | 3023 | 0 | 0 | 22;25;30;31;39;60 | 22 | 25 | 30 | 31 | 39 | 60 |
| 2026-06-23 | 3022 | 1 | 2813548 | 2;3;8;11;17;22 | 2 | 3 | 8 | 11 | 17 | 22 |
| 2026-06-20 | 3021 | 1 | 39427096 | 16;19;22;24;46;58 | 16 | 19 | 22 | 24 | 46 | 58 |
| 2026-06-18 | 3020 | 0 | 0 | 6;9;17;27;29;45 | 6 | 9 | 17 | 27 | 29 | 45 |
| 2026-06-16 | 3019 | 0 | 0 | 5;31;32;48;54;56 | 5 | 31 | 32 | 48 | 54 | 56 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:---|:---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Mega-sena | 1996-03-11 | 3025 | 656 | 0.22 | 27635428.1 | 289420865 | 348732.75 | 18150 | 10 | 26 |
| Lotofácil | 2003-09-29 | 3723 | 3260 | 0.88 | 1002805.8 | 8252873 | 10712.22 | 55845 | 20 | 16 |
| Quina | 1994-03-13 | 7053 | 2640 | 0.37 | 3661162.9 | 579215957 | 14230.37 | 35265 | 4 | 47 |
| Lotomania | 1999-10-02 | 2943 | 717 | 0.24 | 2618586.8 | 37261930 | 109348.66 | 58860 | 43 | 96 |
| Timemania | 2008-03-01 | 2409 | 80 | 0.03 | 26191777.3 | 818652938 | 164711.44 | 16863 | 21 | 53 |
| Super Sete | 2020-10-02 | 866 | 33 | 0.04 | 3300658.6 | 10146164 | 124747.77 | 6062 | 7 | 8 |
| Dia de Sorte | 2018-05-19 | 1233 | 371 | 0.30 | 843414.4 | 4872572 | 59101.35 | 8631 | 10 | 1 |
