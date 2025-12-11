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
| Mega-sena    | 1996-03-11             |                 2949 |                               646 |                    0.22 |      26635249.7 |    289420865 |    348732.75 |                   17694 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3559 |                              3135 |                    0.88 |        985342.5 |      8252873 |     10712.22 |                   53385 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6899 |                              2620 |                    0.38 |       3601971.7 |    579215957 |     14230.37 |                   34495 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2860 |                               706 |                    0.25 |       2580335.9 |     37261930 |    109348.66 |                   57200 |                   43 |                    96 |
| Timemania    | 2008-03-01             |                 2329 |                                78 |                    0.03 |      25486153.3 |    818652938 |    164711.44 |                   16303 |                   20 |                    53 |
| Super Sete   | 2020-10-02             |                  783 |                                31 |                    0.04 |       3270354.4 |     10146164 |    124747.77 |                    5481 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1150 |                               354 |                    0.31 |        828814.1 |      4872572 |     59101.35 |                    8050 |                   10 |                     1 |

Para obter todos os resultados de um determinado produto:

``` r
mega_sena <- loterrrias::resultado_todos(produto = 'megasena')

mega_sena |> 
  tail(10) |> 
  knitr::kable()
```

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | numeros_sorteados | num_1 | num_2 | num_3 | num_4 | num_5 | num_6 |
|:--------------|---------:|---------------:|--------------------:|:------------------|------:|------:|------:|------:|------:|------:|
| 2025-11-14    |     2940 |              1 |            99085707 | 7;8;9;13;22;53    |     7 |     8 |     9 |    13 |    22 |    53 |
| 2025-11-18    |     2941 |              0 |                   0 | 14;30;33;35;48;51 |    14 |    30 |    33 |    35 |    48 |    51 |
| 2025-11-22    |     2942 |              0 |                   0 | 12;30;40;46;54;60 |    12 |    30 |    40 |    46 |    54 |    60 |
| 2025-11-25    |     2943 |              1 |            14986158 | 8;29;30;36;39;60  |     8 |    29 |    30 |    36 |    39 |    60 |
| 2025-11-27    |     2944 |              0 |                   0 | 8;15;23;39;40;59  |     8 |    15 |    23 |    39 |    40 |    59 |
| 2025-11-29    |     2945 |              1 |            27233419 | 1;2;3;7;27;33     |     1 |     2 |     3 |     7 |    27 |    33 |
| 2025-12-02    |     2946 |              0 |                   0 | 4;13;17;21;49;54  |     4 |    13 |    17 |    21 |    49 |    54 |
| 2025-12-04    |     2947 |              0 |                   0 | 4;10;15;37;39;44  |     4 |    10 |    15 |    37 |    39 |    44 |
| 2025-12-06    |     2948 |              0 |                   0 | 6;24;37;52;53;58  |     6 |    24 |    37 |    52 |    53 |    58 |
| 2025-12-09    |     2949 |              0 |                   0 | 4;6;11;38;49;54   |     4 |     6 |    11 |    38 |    49 |    54 |

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
| 2025-12-09    |     1150 |              0 |                   0 | 6;8;10;11;18;26;30 |     6 |     8 |    10 |    11 |    18 |    26 |    30 |
