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
| Mega-sena    | 1996-03-11             |                 2944 |                               645 |                    0.22 |      26634322.3 |    289420865 |    348732.75 |                   17664 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3548 |                              3126 |                    0.88 |        985485.2 |      8252873 |     10712.22 |                   53220 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6888 |                              2617 |                    0.38 |       3601134.9 |    579215957 |     14230.37 |                   34440 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2854 |                               705 |                    0.25 |       2577450.4 |     37261930 |    109348.66 |                   57080 |                   43 |                    96 |
| Timemania    | 2008-03-01             |                 2324 |                                78 |                    0.03 |      25486153.3 |    818652938 |    164711.44 |                   16268 |                   20 |                    53 |
| Super Sete   | 2020-10-02             |                  777 |                                30 |                    0.04 |       3168014.8 |     10146164 |    124747.77 |                    5439 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1145 |                               351 |                    0.31 |        833146.4 |      4872572 |     59101.35 |                    8015 |                   10 |                     1 |

Para obter todos os resultados de um determinado produto:

``` r
mega_sena <- loterrrias::resultado_todos(produto = 'megasena')

mega_sena |> 
  tail(10) |> 
  knitr::kable()
```

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | numeros_sorteados | num_1 | num_2 | num_3 | num_4 | num_5 | num_6 |
|:--------------|---------:|---------------:|--------------------:|:------------------|------:|------:|------:|------:|------:|------:|
| 2025-11-01    |     2935 |              0 |                   0 | 9;18;28;34;38;57  |     9 |    18 |    28 |    34 |    38 |    57 |
| 2025-11-04    |     2936 |              0 |                   0 | 4;7;9;15;29;32    |     4 |     7 |     9 |    15 |    29 |    32 |
| 2025-11-06    |     2937 |              0 |                   0 | 12;17;26;34;44;52 |    12 |    17 |    26 |    34 |    44 |    52 |
| 2025-11-08    |     2938 |              0 |                   0 | 10;14;15;35;44;56 |    10 |    14 |    15 |    35 |    44 |    56 |
| 2025-11-11    |     2939 |              0 |                   0 | 22;31;33;37;42;49 |    22 |    31 |    33 |    37 |    42 |    49 |
| 2025-11-14    |     2940 |              1 |            99085707 | 7;8;9;13;22;53    |     7 |     8 |     9 |    13 |    22 |    53 |
| 2025-11-18    |     2941 |              0 |                   0 | 14;30;33;35;48;51 |    14 |    30 |    33 |    35 |    48 |    51 |
| 2025-11-22    |     2942 |              0 |                   0 | 12;30;40;46;54;60 |    12 |    30 |    40 |    46 |    54 |    60 |
| 2025-11-25    |     2943 |              1 |            14986158 | 8;29;30;36;39;60  |     8 |    29 |    30 |    36 |    39 |    60 |
| 2025-11-27    |     2944 |              0 |                   0 | 8;15;23;39;40;59  |     8 |    15 |    23 |    39 |    40 |    59 |

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

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | numeros_sorteados  | num_1 | num_2 | num_3 | num_4 | num_5 | num_6 | num_7 |
|:--------------|---------:|---------------:|--------------------:|:-------------------|------:|------:|------:|------:|------:|------:|------:|
| 2025-11-27    |     1145 |              0 |                   0 | 4;9;12;14;16;22;27 |     4 |     9 |    12 |    14 |    16 |    22 |    27 |
