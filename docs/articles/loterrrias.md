# Utilizando o pacote loterrrias

Segue um resumo do uso das funções disponíveis no pacote **loterrrias**.

Para ter acesso aos produtos das Loterias presentes no pacote:

``` r
loterrrias::produtos_existentes() |> 
  knitr::kable()
```

| nome_produto | parametro_produto | qtde_numeros_sorteio |
|:-------------|:------------------|---------------------:|
| Mega-sena    | megasena          |                    6 |
| Lotofácil    | lotofacil         |                   15 |
| Quina        | quina             |                    5 |
| Lotomania    | lotomania         |                   20 |
| Timemania    | timemania         |                    7 |
| Super Sete   | supersete         |                    7 |
| Dia de Sorte | diadesorte        |                    7 |

Para obter um resumo do histórico de todos os produtos:

``` r
loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:-------------|:-----------------------|---------------------:|----------------------------------:|------------------------:|----------------:|-------------:|-------------:|------------------------:|---------------------:|----------------------:|
| Mega-sena    | 1996-03-11             |                 2986 |                               650 |                    0.22 |      27266160.7 |    289420865 |    348732.75 |                   17916 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3641 |                              3199 |                    0.88 |        994609.0 |      8252873 |     10712.22 |                   54615 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6981 |                              2632 |                    0.38 |       3631558.0 |    579215957 |     14230.37 |                   34905 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2902 |                               709 |                    0.24 |       2596079.6 |     37261930 |    109348.66 |                   58040 |                   43 |                    96 |
| Timemania    | 2008-03-01             |                 2369 |                                79 |                    0.03 |      26090570.6 |    818652938 |    164711.44 |                   16583 |                   21 |                    53 |
| Super Sete   | 2020-10-02             |                  825 |                                32 |                    0.04 |       3179529.6 |     10146164 |    124747.77 |                    5775 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1190 |                               361 |                    0.30 |        833947.1 |      4872572 |     59101.35 |                    8330 |                   10 |                     1 |

Para obter todos os resultados de um determinado produto:

``` r
mega_sena <- loterrrias::resultado_todos(produto = 'megasena')

mega_sena |> 
  tail(10) |> 
  knitr::kable()
```

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | numeros_sorteados | num_1 | num_2 | num_3 | num_4 | num_5 | num_6 |
|:--------------|---------:|---------------:|--------------------:|:------------------|------:|------:|------:|------:|------:|------:|
| 2026-02-26    |     2977 |              0 |                   0 | 8;19;27;32;38;52  |     8 |    19 |    27 |    32 |    38 |    52 |
| 2026-02-28    |     2978 |              0 |                   0 | 6;9;13;20;42;50   |     6 |     9 |    13 |    20 |    42 |    50 |
| 2026-03-03    |     2979 |              1 |           158039482 | 18;27;37;43;47;53 |    18 |    27 |    37 |    43 |    47 |    53 |
| 2026-03-05    |     2980 |              0 |                   0 | 3;14;27;33;43;45  |     3 |    14 |    27 |    33 |    43 |    45 |
| 2026-03-07    |     2981 |              0 |                   0 | 15;22;27;32;50;58 |    15 |    22 |    27 |    32 |    50 |    58 |
| 2026-03-10    |     2982 |              0 |                   0 | 2;35;41;46;49;58  |     2 |    35 |    41 |    46 |    49 |    58 |
| 2026-03-12    |     2983 |              0 |                   0 | 3;15;30;32;40;52  |     3 |    15 |    30 |    32 |    40 |    52 |
| 2026-03-14    |     2984 |              0 |                   0 | 6;11;15;28;42;60  |     6 |    11 |    15 |    28 |    42 |    60 |
| 2026-03-17    |     2985 |              1 |            34856053 | 6;8;21;32;41;60   |     6 |     8 |    21 |    32 |    41 |    60 |
| 2026-03-19    |     2986 |              0 |                   0 | 1;5;13;26;41;53   |     1 |     5 |    13 |    26 |    41 |    53 |

Para obter o resultado de um determinado concurso de um produto:

``` r
quina <- loterrrias::resultado_concurso(produto = 'quina', num_concurso = 1)

quina |> 
  tail(10) |> 
  knitr::kable()
```

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | numeros_sorteados | num_1 | num_2 | num_3 | num_4 | num_5 |
|:--------------|---------:|---------------:|--------------------:|:------------------|------:|------:|------:|------:|------:|
| 1994-03-13    |        1 |              1 |            75731225 | 25;45;60;76;79    |    25 |    45 |    60 |    76 |    79 |

Para obter os resultados de um range de concursos de um produto:

``` r
time_mania <- loterrrias::resultado_concursos(
  produto = 'timemania',
  num_concurso_inicial = 1801,
  num_concurso_final = 1810
)

time_mania |> 
  tail(10) |> 
  knitr::kable()
```

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | time              | numeros_sorteados    | num_1 | num_2 | num_3 | num_4 | num_5 | num_6 | num_7 |
|:--------------|---------:|---------------:|--------------------:|:------------------|:---------------------|------:|------:|------:|------:|------:|------:|------:|
| 2022-06-28    |     1801 |              0 |                   0 | FERROVIARIA/SP    | 11;40;46;54;59;60;72 |    11 |    40 |    46 |    54 |    59 |    60 |    72 |
| 2022-06-30    |     1802 |              0 |                   0 | MIRASSOL/SP       | 1;32;38;51;54;59;65  |     1 |    32 |    38 |    51 |    54 |    59 |    65 |
| 2022-07-02    |     1803 |              0 |                   0 | MOTO CLUB/MA      | 7;28;31;41;50;59;66  |     7 |    28 |    31 |    41 |    50 |    59 |    66 |
| 2022-07-05    |     1804 |              0 |                   0 | MOTO CLUB/MA      | 1;47;55;56;57;64;78  |     1 |    47 |    55 |    56 |    57 |    64 |    78 |
| 2022-07-07    |     1805 |              0 |                   0 | NAUTICO/PE        | 1;7;12;41;55;66;72   |     1 |     7 |    12 |    41 |    55 |    66 |    72 |
| 2022-07-09    |     1806 |              0 |                   0 | MANAUS/AM         | 30;32;40;44;67;74;77 |    30 |    32 |    40 |    44 |    67 |    74 |    77 |
| 2022-07-12    |     1807 |              0 |                   0 | SAMPAIO CORREA/MA | 28;32;39;44;45;67;73 |    28 |    32 |    39 |    44 |    45 |    67 |    73 |
| 2022-07-14    |     1808 |              0 |                   0 | ATHLETICO/PR      | 34;44;56;59;67;70;77 |    34 |    44 |    56 |    59 |    67 |    70 |    77 |
| 2022-07-16    |     1809 |              0 |                   0 | JUVENTUDE/RS      | 6;14;17;29;38;62;79  |     6 |    14 |    17 |    29 |    38 |    62 |    79 |
| 2022-07-19    |     1810 |              1 |            55653686 | PONTE PRETA/SP    | 11;21;27;37;58;64;65 |    11 |    21 |    27 |    37 |    58 |    64 |    65 |

Para obter o resultado do último concurso de um produto:

``` r
dia_de_sorte <- loterrrias::resultado_ultimo_concurso(produto = 'diadesorte')

dia_de_sorte |> 
  tail(10) |> 
  knitr::kable()
```

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | numeros_sorteados   | num_1 | num_2 | num_3 | num_4 | num_5 | num_6 | num_7 |
|:--------------|---------:|---------------:|--------------------:|:--------------------|------:|------:|------:|------:|------:|------:|------:|
| 2026-03-19    |     1190 |              0 |                   0 | 5;10;14;18;19;24;26 |     5 |    10 |    14 |    18 |    19 |    24 |    26 |
