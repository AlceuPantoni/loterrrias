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
| 2025-11-18    |     2941 |              0 |                   0 | 14;30;33;35;48;51 |    14 |    30 |    33 |    35 |    48 |    51 |
| 2025-11-14    |     2940 |              1 |            99085707 | 7;8;9;13;22;53    |     7 |     8 |     9 |    13 |    22 |    53 |
| 2025-11-11    |     2939 |              0 |                   0 | 22;31;33;37;42;49 |    22 |    31 |    33 |    37 |    42 |    49 |
| 2025-11-08    |     2938 |              0 |                   0 | 10;14;15;35;44;56 |    10 |    14 |    15 |    35 |    44 |    56 |
| 2025-11-06    |     2937 |              0 |                   0 | 12;17;26;34;44;52 |    12 |    17 |    26 |    34 |    44 |    52 |
| 2025-11-04    |     2936 |              0 |                   0 | 4;7;9;15;29;32    |     4 |     7 |     9 |    15 |    29 |    32 |
| 2025-11-01    |     2935 |              0 |                   0 | 9;18;28;34;38;57  |     9 |    18 |    28 |    34 |    38 |    57 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2941 |                               644 |                    0.22 |      26652409.6 |    289420865 |    348732.75 |                   17646 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3541 |                              3121 |                    0.88 |        985104.4 |      8252873 |     10712.22 |                   53115 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6881 |                              2615 |                    0.38 |       3599461.1 |    579215957 |     14230.37 |                   34405 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2850 |                               705 |                    0.25 |       2577450.4 |     37261930 |    109348.66 |                   57000 |                   47 |                    96 |
| Timemania    | 2008-03-01             |                 2321 |                                78 |                    0.03 |      25486153.3 |    818652938 |    164711.44 |                   16247 |                   20 |                    53 |
| Super Sete   | 2020-10-02             |                  773 |                                30 |                    0.04 |       3168014.8 |     10146164 |    124747.77 |                    5411 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1142 |                               350 |                    0.31 |        835201.3 |      4872572 |     59101.35 |                    7994 |                   10 |                     1 |
