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
| 2026-03-24    |     2988 |              0 |                   0 | 21;23;28;36;57;58 |    21 |    23 |    28 |    36 |    57 |    58 |
| 2026-03-21    |     2987 |              0 |                   0 | 16;17;20;28;46;47 |    16 |    17 |    20 |    28 |    46 |    47 |
| 2026-03-19    |     2986 |              0 |                   0 | 1;5;13;26;41;53   |     1 |     5 |    13 |    26 |    41 |    53 |
| 2026-03-17    |     2985 |              1 |            34856053 | 6;8;21;32;41;60   |     6 |     8 |    21 |    32 |    41 |    60 |
| 2026-03-14    |     2984 |              0 |                   0 | 6;11;15;28;42;60  |     6 |    11 |    15 |    28 |    42 |    60 |
| 2026-03-12    |     2983 |              0 |                   0 | 3;15;30;32;40;52  |     3 |    15 |    30 |    32 |    40 |    52 |
| 2026-03-10    |     2982 |              0 |                   0 | 2;35;41;46;49;58  |     2 |    35 |    41 |    46 |    49 |    58 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2988 |                               650 |                    0.22 |      27266160.7 |    289420865 |    348732.75 |                   17928 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3645 |                              3203 |                    0.88 |        995110.7 |      8252873 |     10712.22 |                   54675 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6985 |                              2632 |                    0.38 |       3631558.0 |    579215957 |     14230.37 |                   34925 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2904 |                               709 |                    0.24 |       2596079.6 |     37261930 |    109348.66 |                   58080 |                   43 |                    96 |
| Timemania    | 2008-03-01             |                 2371 |                                79 |                    0.03 |      26090570.6 |    818652938 |    164711.44 |                   16597 |                   21 |                    53 |
| Super Sete   | 2020-10-02             |                  827 |                                32 |                    0.04 |       3179529.6 |     10146164 |    124747.77 |                    5789 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1192 |                               362 |                    0.30 |        837719.2 |      4872572 |     59101.35 |                    8344 |                   10 |                     1 |
