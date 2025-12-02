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
| 2025-11-29    |     2945 |              1 |            27233419 | 1;2;3;7;27;33     |     1 |     2 |     3 |     7 |    27 |    33 |
| 2025-11-27    |     2944 |              0 |                   0 | 8;15;23;39;40;59  |     8 |    15 |    23 |    39 |    40 |    59 |
| 2025-11-25    |     2943 |              1 |            14986158 | 8;29;30;36;39;60  |     8 |    29 |    30 |    36 |    39 |    60 |
| 2025-11-22    |     2942 |              0 |                   0 | 12;30;40;46;54;60 |    12 |    30 |    40 |    46 |    54 |    60 |
| 2025-11-18    |     2941 |              0 |                   0 | 14;30;33;35;48;51 |    14 |    30 |    33 |    35 |    48 |    51 |
| 2025-11-14    |     2940 |              1 |            99085707 | 7;8;9;13;22;53    |     7 |     8 |     9 |    13 |    22 |    53 |
| 2025-11-11    |     2939 |              0 |                   0 | 22;31;33;37;42;49 |    22 |    31 |    33 |    37 |    42 |    49 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2945 |                               646 |                    0.22 |      26635249.7 |    289420865 |    348732.75 |                   17670 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3551 |                              3128 |                    0.88 |        985843.0 |      8252873 |     10712.22 |                   53265 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6891 |                              2617 |                    0.38 |       3601134.9 |    579215957 |     14230.37 |                   34455 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2856 |                               705 |                    0.25 |       2577450.4 |     37261930 |    109348.66 |                   57120 |                   43 |                    96 |
| Timemania    | 2008-03-01             |                 2325 |                                78 |                    0.03 |      25486153.3 |    818652938 |    164711.44 |                   16275 |                   20 |                    53 |
| Super Sete   | 2020-10-02             |                  779 |                                30 |                    0.04 |       3168014.8 |     10146164 |    124747.77 |                    5453 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1146 |                               352 |                    0.31 |        832493.1 |      4872572 |     59101.35 |                    8022 |                   10 |                     1 |
