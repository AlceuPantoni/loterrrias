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
| 2025-12-16    |     2952 |              0 |                   0 | 1;20;45;48;51;58  |     1 |    20 |    45 |    48 |    51 |    58 |
| 2025-12-13    |     2951 |              0 |                   0 | 5;8;30;31;37;45   |     5 |     8 |    30 |    31 |    37 |    45 |
| 2025-12-11    |     2950 |              0 |                   0 | 21;23;42;49;50;60 |    21 |    23 |    42 |    49 |    50 |    60 |
| 2025-12-09    |     2949 |              0 |                   0 | 4;6;11;38;49;54   |     4 |     6 |    11 |    38 |    49 |    54 |
| 2025-12-06    |     2948 |              0 |                   0 | 6;24;37;52;53;58  |     6 |    24 |    37 |    52 |    53 |    58 |
| 2025-12-04    |     2947 |              0 |                   0 | 4;10;15;37;39;44  |     4 |    10 |    15 |    37 |    39 |    44 |
| 2025-12-02    |     2946 |              0 |                   0 | 4;13;17;21;49;54  |     4 |    13 |    17 |    21 |    49 |    54 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2952 |                               646 |                    0.22 |      26635249.7 |    289420865 |    348732.75 |                   17712 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3564 |                              3139 |                    0.88 |        985639.7 |      8252873 |     10712.22 |                   53460 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6904 |                              2621 |                    0.38 |       3602397.8 |    579215957 |     14230.37 |                   34520 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2862 |                               706 |                    0.25 |       2580335.9 |     37261930 |    109348.66 |                   57240 |                   43 |                    96 |
| Timemania    | 2008-03-01             |                 2332 |                                78 |                    0.03 |      25486153.3 |    818652938 |    164711.44 |                   16324 |                   20 |                    53 |
| Super Sete   | 2020-10-02             |                  785 |                                31 |                    0.04 |       3270354.4 |     10146164 |    124747.77 |                    5495 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1153 |                               354 |                    0.31 |        828814.1 |      4872572 |     59101.35 |                    8071 |                   10 |                     1 |
