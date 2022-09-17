
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Pacote Loterrrias <img src="man/figures/logo.png" align="right" height="139" />

<!-- badges: start -->
<!-- badges: end -->

Este pacote tem por objetivo disponilizar os dados dos produtos das
Loterias do Brasil.

Os dados foram obtidos diretamente do site das
[Loterias](https://loterias.caixa.gov.br/Paginas/default.aspx) da
[Caixa](https://www.caixa.gov.br/Paginas/home-caixa.aspx) através do uso
de técnicas de Web Scraping.

Caso necessário, é possível fazer download das base de dados em formado
**xlsx** através dos links abaixo:

-   [Dia_de_Sorte`.xlsx`](https://github.com/AlceuPantoni/loterrrias/tree/main/data-raw/resultados_diadesorte.xlsx?raw=true)
-   [Lotofacil`.xlsx`](https://github.com/AlceuPantoni/loterrrias/tree/main/data-raw/resultados_lotofacil.xlsx?raw=true)
-   [Lotomania`.xlsx`](https://github.com/AlceuPantoni/loterrrias/tree/main/data-raw/resultados_lotomania.xlsx?raw=true)
-   [Mega-Sena`.xlsx`](https://github.com/AlceuPantoni/loterrrias/tree/main/data-raw/resultados_megasena.xlsx?raw=true)
-   [Quina`.xlsx`](https://github.com/AlceuPantoni/loterrrias/tree/main/data-raw/resultados_quina.xlsx?raw=true)
-   [Super_Sete`.xlsx`](https://github.com/AlceuPantoni/loterrrias/tree/main/data-raw/resultados_supersete.xlsx?raw=true)
-   [Timemania`.xlsx`](https://github.com/AlceuPantoni/loterrrias/tree/main/data-raw/resultados_timemania.xlsx?raw=true)

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
| 2022-09-15    |     2520 |              0 |                   0 | 2;17;22;41;58;60  |     2 |    17 |    22 |    41 |    58 |    60 |
| 2022-09-13    |     2519 |              0 |                   0 | 3;8;20;36;38;57   |     3 |     8 |    20 |    36 |    38 |    57 |
| 2022-09-10    |     2518 |              0 |                   0 | 3;22;23;44;53;60  |     3 |    22 |    23 |    44 |    53 |    60 |
| 2022-09-08    |     2517 |              0 |                   0 | 1;5;6;16;22;39    |     1 |     5 |     6 |    16 |    22 |    39 |
| 2022-09-03    |     2516 |              0 |                   0 | 8;17;49;51;52;53  |     8 |    17 |    49 |    51 |    52 |    53 |
| 2022-08-31    |     2515 |              0 |                   0 | 3;12;19;41;45;54  |     3 |    12 |    19 |    41 |    45 |    54 |
| 2022-08-27    |     2514 |              0 |                   0 | 5;15;24;34;45;52  |     5 |    15 |    24 |    34 |    45 |    52 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2519 |                               575 |                    0.23 |      22450538.9 |    289420865 |    348732.75 |                   15114 |                   53 |                    26 |
| Lotofácil    | 2003-09-29             |                 2612 |                              2350 |                    0.90 |        888452.7 |      8227507 |     10712.22 |                   39180 |                   20 |                     8 |
| Quina        | 1994-03-13             |                 5948 |                              2470 |                    0.42 |       3230198.2 |    579215957 |         0.00 |                   29740 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2364 |                               642 |                    0.27 |       2247331.6 |     37261930 |    109348.66 |                   47280 |                   47 |                    96 |
| Timemania    | 2008-03-01             |                 1834 |                                68 |                    0.04 |      27234282.4 |    818652938 |    164711.44 |                   12838 |                   21 |                    53 |
| Super Sete   | 2020-10-02             |                  294 |                                18 |                    0.06 |       2458611.5 |      7786503 |    124747.77 |                    2058 |                    9 |                     1 |
| Dia de Sorte | 2018-05-19             |                  655 |                               228 |                    0.35 |        818112.2 |      3770060 |     59101.35 |                    4585 |                   10 |                     1 |
