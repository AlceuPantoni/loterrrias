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
| 2026-01-13    |     2959 |              0 |                   0 | 18;26;35;41;44;45 |    18 |    26 |    35 |    41 |    44 |    45 |
| 2026-01-10    |     2958 |              0 |                   0 | 7;9;14;35;42;49   |     7 |     9 |    14 |    35 |    42 |    49 |
| 2026-01-08    |     2957 |              0 |                   0 | 19;28;36;37;48;52 |    19 |    28 |    36 |    37 |    48 |    52 |
| 2026-01-06    |     2956 |              0 |                   0 | 10;18;21;24;43;47 |    10 |    18 |    21 |    24 |    43 |    47 |
| 2026-01-01    |     2955 |              1 |           181892881 | 9;13;21;32;33;59  |     9 |    13 |    21 |    32 |    33 |    59 |
| 2025-12-20    |     2954 |              0 |                   0 | 1;9;37;39;42;44   |     1 |     9 |    37 |    39 |    42 |    44 |
| 2025-12-18    |     2953 |              0 |                   0 | 5;10;24;25;47;54  |     5 |    10 |    24 |    25 |    47 |    54 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2959 |                               647 |                    0.22 |      26875215.2 |    289420865 |    348732.75 |                   17754 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3587 |                              3157 |                    0.88 |        986822.6 |      8252873 |     10712.22 |                   53805 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6927 |                              2624 |                    0.38 |       3609055.6 |    579215957 |     14230.37 |                   34635 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2875 |                               707 |                    0.25 |       2594572.2 |     37261930 |    109348.66 |                   57500 |                   43 |                    96 |
| Timemania    | 2008-03-01             |                 2342 |                                79 |                    0.03 |      26090570.6 |    818652938 |    164711.44 |                   16394 |                   21 |                    53 |
| Super Sete   | 2020-10-02             |                  798 |                                32 |                    0.04 |       3179529.6 |     10146164 |    124747.77 |                    5586 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1163 |                               358 |                    0.31 |        828136.6 |      4872572 |     59101.35 |                    8141 |                   10 |                     1 |
