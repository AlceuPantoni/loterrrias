# loterrrias

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
| 2026-08-30 | 3051 | 0 | 0 | 11;15;20;21;38;48 | 11 | 15 | 20 | 21 | 38 | 48 |
| 2026-08-27 | 3050 | 0 | 0 | 11;14;30;38;49;55 | 11 | 14 | 30 | 38 | 49 | 55 |
| 2026-08-25 | 3049 | 0 | 0 | 6;13;36;43;53;55 | 6 | 13 | 36 | 43 | 53 | 55 |
| 2026-08-23 | 3048 | 1 | 57261598 | 2;6;27;39;44;50 | 2 | 6 | 27 | 39 | 44 | 50 |
| 2026-08-20 | 3047 | 0 | 0 | 4;18;22;26;31;58 | 4 | 18 | 22 | 26 | 31 | 58 |
| 2026-08-18 | 3046 | 0 | 0 | 16;23;24;33;36;52 | 16 | 23 | 24 | 33 | 36 | 52 |
| 2026-08-16 | 3045 | 0 | 0 | 23;29;33;42;43;57 | 23 | 29 | 33 | 42 | 43 | 57 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r

loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:---|:---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Mega-sena | 1996-03-11 | 3051 | 660 | 0.22 | 27874460.4 | 289420865 | 348732.75 | 18306 | 10 | 26 |
| Lotofácil | 2003-09-29 | 3775 | 3295 | 0.87 | 1011925.3 | 14264457 | 10712.22 | 56625 | 20 | 16 |
| Quina | 1994-03-13 | 7105 | 2645 | 0.37 | 3678617.2 | 579215957 | 14230.37 | 35525 | 4 | 47 |
| Lotomania | 1999-10-02 | 2969 | 720 | 0.24 | 2637930.8 | 37261930 | 109348.66 | 59380 | 43 | 96 |
| Timemania | 2008-03-01 | 2435 | 80 | 0.03 | 26191777.3 | 818652938 | 164711.44 | 17045 | 21 | 53 |
| Super Sete | 2020-10-02 | 892 | 33 | 0.04 | 3300658.6 | 10146164 | 124747.77 | 6244 | 5 | 8 |
| Dia de Sorte | 2018-05-19 | 1285 | 380 | 0.30 | 835178.9 | 4872572 | 59101.35 | 8995 | 10 | 1 |
