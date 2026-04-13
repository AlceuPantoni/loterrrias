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
| 2026-04-11    |     2995 |              0 |                   0 | 8;29;42;49;50;58  |     8 |    29 |    42 |    49 |    50 |    58 |
| 2026-04-09    |     2994 |              0 |                   0 | 1;10;23;31;40;55  |     1 |    10 |    23 |    31 |    40 |    55 |
| 2026-04-07    |     2993 |              0 |                   0 | 3;15;31;42;43;51  |     3 |    15 |    31 |    42 |    43 |    51 |
| 2026-04-04    |     2992 |              0 |                   0 | 4;17;23;33;36;49  |     4 |    17 |    23 |    33 |    36 |    49 |
| 2026-03-31    |     2991 |              0 |                   0 | 4;14;19;23;36;53  |     4 |    14 |    19 |    23 |    36 |    53 |
| 2026-03-28    |     2990 |              1 |            37983332 | 6;14;18;29;30;44  |     6 |    14 |    18 |    29 |    30 |    44 |
| 2026-03-26    |     2989 |              0 |                   0 | 6;14;28;31;56;59  |     6 |    14 |    28 |    31 |    56 |    59 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2995 |                               651 |                    0.22 |      27282623.3 |    289420865 |    348732.75 |                   17970 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3659 |                              3214 |                    0.88 |        996989.1 |      8252873 |     10712.22 |                   54885 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6999 |                              2634 |                    0.38 |       3632578.3 |    579215957 |     14230.37 |                   34995 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2910 |                               710 |                    0.24 |       2613829.1 |     37261930 |    109348.66 |                   58200 |                   43 |                    96 |
| Timemania    | 2008-03-01             |                 2379 |                                79 |                    0.03 |      26090570.6 |    818652938 |    164711.44 |                   16653 |                   21 |                    53 |
| Super Sete   | 2020-10-02             |                  833 |                                32 |                    0.04 |       3179529.6 |     10146164 |    124747.77 |                    5831 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1200 |                               363 |                    0.30 |        839903.9 |      4872572 |     59101.35 |                    8400 |                   10 |                     1 |
