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
|:--------------|---------:|---------------:|--------------------:|:------------------|------:|------:|------:|------:|------:|------:|
| 2026-04-25    |     3000 |              0 |                   0 | 22;23;36;40;52;60 |    22 |    23 |    36 |    40 |    52 |    60 |
| 2026-04-23    |     2999 |              0 |                   0 | 9;24;26;38;45;58  |     9 |    24 |    26 |    38 |    45 |    58 |
| 2026-04-18    |     2998 |              0 |                   0 | 15;18;28;31;52;58 |    15 |    18 |    28 |    31 |    52 |    58 |
| 2026-04-16    |     2997 |              0 |                   0 | 14;20;32;37;39;42 |    14 |    20 |    32 |    37 |    39 |    42 |
| 2026-04-14    |     2996 |              0 |                   0 | 7;9;27;38;49;52   |     7 |     9 |    27 |    38 |    49 |    52 |
| 2026-04-11    |     2995 |              0 |                   0 | 8;29;42;49;50;58  |     8 |    29 |    42 |    49 |    50 |    58 |
| 2026-04-09    |     2994 |              0 |                   0 | 1;10;23;31;40;55  |     1 |    10 |    23 |    31 |    40 |    55 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 3000 |                               651 |                    0.22 |      27282623.3 |    289420865 |    348732.75 |                   18000 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3671 |                              3222 |                    0.88 |       1000343.3 |      8252873 |     10712.22 |                   55065 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 7011 |                              2635 |                    0.38 |       3637455.5 |    579215957 |     14230.37 |                   35055 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2917 |                               712 |                    0.24 |       2612051.5 |     37261930 |    109348.66 |                   58340 |                   43 |                    96 |
| Timemania    | 2008-03-01             |                 2384 |                                79 |                    0.03 |      26090570.6 |    818652938 |    164711.44 |                   16688 |                   21 |                    53 |
| Super Sete   | 2020-10-02             |                  840 |                                32 |                    0.04 |       3179529.6 |     10146164 |    124747.77 |                    5880 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1205 |                               364 |                    0.30 |        844427.4 |      4872572 |     59101.35 |                    8435 |                   10 |                     1 |
