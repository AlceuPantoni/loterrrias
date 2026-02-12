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
| 2026-02-10    |     2971 |              0 |                   0 | 1;27;39;40;46;56  |     1 |    27 |    39 |    40 |    46 |    56 |
| 2026-02-07    |     2970 |              0 |                   0 | 22;32;37;41;42;59 |    22 |    32 |    37 |    41 |    42 |    59 |
| 2026-02-05    |     2969 |              1 |           141844706 | 1;2;5;14;18;32    |     1 |     2 |     5 |    14 |    18 |    32 |
| 2026-02-03    |     2968 |              0 |                   0 | 10;11;22;26;36;46 |    10 |    11 |    22 |    26 |    36 |    46 |
| 2026-01-31    |     2967 |              0 |                   0 | 1;6;38;47;56;60   |     1 |     6 |    38 |    47 |    56 |    60 |
| 2026-01-29    |     2966 |              0 |                   0 | 6;7;9;43;44;53    |     6 |     7 |     9 |    43 |    44 |    53 |
| 2026-01-27    |     2965 |              0 |                   0 | 1;20;22;23;35;57  |     1 |    20 |    22 |    23 |    35 |    57 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2971 |                               648 |                    0.22 |      27052637.2 |    289420865 |    348732.75 |                   17826 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3611 |                              3174 |                    0.88 |        992841.3 |      8252873 |     10712.22 |                   54165 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6951 |                              2626 |                    0.38 |       3615888.5 |    579215957 |     14230.37 |                   34755 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2887 |                               708 |                    0.25 |       2595953.1 |     37261930 |    109348.66 |                   57740 |                   43 |                    96 |
| Timemania    | 2008-03-01             |                 2354 |                                79 |                    0.03 |      26090570.6 |    818652938 |    164711.44 |                   16478 |                   21 |                    53 |
| Super Sete   | 2020-10-02             |                  810 |                                32 |                    0.04 |       3179529.6 |     10146164 |    124747.77 |                    5670 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1175 |                               360 |                    0.31 |        833675.6 |      4872572 |     59101.35 |                    8225 |                   10 |                     1 |
