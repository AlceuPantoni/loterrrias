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
| Mega-sena    | 1996-03-11             |                 2939 |                               643 |                    0.22 |      26539760.6 |    289420865 |    348732.75 |                   17634 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3538 |                              3120 |                    0.88 |        984973.6 |      8252873 |     10712.22 |                   53070 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6878 |                              2615 |                    0.38 |       3599461.1 |    579215957 |     14230.37 |                   34390 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2848 |                               704 |                    0.25 |       2579178.6 |     37261930 |    109348.66 |                   56960 |                   47 |                    96 |
| Timemania    | 2008-03-01             |                 2320 |                                78 |                    0.03 |      25486153.3 |    818652938 |    164711.44 |                   16240 |                   20 |                    53 |
| Super Sete   | 2020-10-02             |                  771 |                                30 |                    0.04 |       3168014.8 |     10146164 |    124747.77 |                    5397 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1141 |                               349 |                    0.31 |        827161.0 |      4872572 |     59101.35 |                    7987 |                   10 |                     1 |

Para obter todos os resultados de um determinado produto:

``` r
mega_sena <- loterrrias::resultado_todos(produto = 'megasena')

mega_sena |> 
  tail(10) |> 
  knitr::kable()
```

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | numeros_sorteados | num_1 | num_2 | num_3 | num_4 | num_5 | num_6 |
|:--------------|---------:|---------------:|--------------------:|:------------------|------:|------:|------:|------:|------:|------:|
| 2025-10-21    |     2930 |              0 |                   0 | 1;11;13;14;36;45  |     1 |    11 |    13 |    14 |    36 |    45 |
| 2025-10-23    |     2931 |              0 |                   0 | 4;19;23;36;47;52  |     4 |    19 |    23 |    36 |    47 |    52 |
| 2025-10-25    |     2932 |              1 |            96166949 | 4;13;25;36;40;53  |     4 |    13 |    25 |    36 |    40 |    53 |
| 2025-10-28    |     2933 |              0 |                   0 | 1;18;22;42;48;50  |     1 |    18 |    22 |    42 |    48 |    50 |
| 2025-10-30    |     2934 |              0 |                   0 | 9;17;23;26;33;59  |     9 |    17 |    23 |    26 |    33 |    59 |
| 2025-11-01    |     2935 |              0 |                   0 | 9;18;28;34;38;57  |     9 |    18 |    28 |    34 |    38 |    57 |
| 2025-11-04    |     2936 |              0 |                   0 | 4;7;9;15;29;32    |     4 |     7 |     9 |    15 |    29 |    32 |
| 2025-11-06    |     2937 |              0 |                   0 | 12;17;26;34;44;52 |    12 |    17 |    26 |    34 |    44 |    52 |
| 2025-11-08    |     2938 |              0 |                   0 | 10;14;15;35;44;56 |    10 |    14 |    15 |    35 |    44 |    56 |
| 2025-11-11    |     2939 |              0 |                   0 | 22;31;33;37;42;49 |    22 |    31 |    33 |    37 |    42 |    49 |

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
| 2025-11-13    |     1141 |              0 |                   0 | 1;9;10;14;16;22;26 |     1 |     9 |    10 |    14 |    16 |    22 |    26 |
