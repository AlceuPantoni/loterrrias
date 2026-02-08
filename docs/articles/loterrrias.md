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
| Mega-sena    | 1996-03-11             |                 2970 |                               648 |                    0.22 |      27052637.2 |    289420865 |    348732.75 |                   17820 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3608 |                              3171 |                    0.88 |        992628.6 |      8252873 |     10712.22 |                   54120 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6948 |                              2626 |                    0.38 |       3615888.5 |    579215957 |     14230.37 |                   34740 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2885 |                               708 |                    0.25 |       2595953.1 |     37261930 |    109348.66 |                   57700 |                   43 |                    96 |
| Timemania    | 2008-03-01             |                 2353 |                                79 |                    0.03 |      26090570.6 |    818652938 |    164711.44 |                   16471 |                   21 |                    53 |
| Super Sete   | 2020-10-02             |                  808 |                                32 |                    0.04 |       3179529.6 |     10146164 |    124747.77 |                    5656 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1174 |                               359 |                    0.31 |        828982.4 |      4872572 |     59101.35 |                    8218 |                   10 |                     1 |

Para obter todos os resultados de um determinado produto:

``` r
mega_sena <- loterrrias::resultado_todos(produto = 'megasena')

mega_sena |> 
  tail(10) |> 
  knitr::kable()
```

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | numeros_sorteados | num_1 | num_2 | num_3 | num_4 | num_5 | num_6 |
|:--------------|---------:|---------------:|--------------------:|:------------------|------:|------:|------:|------:|------:|------:|
| 2026-01-17    |     2961 |              0 |                   0 | 10;13;55;56;59;60 |    10 |    13 |    55 |    56 |    59 |    60 |
| 2026-01-20    |     2962 |              0 |                   0 | 6;29;33;38;53;56  |     6 |    29 |    33 |    38 |    53 |    56 |
| 2026-01-22    |     2963 |              0 |                   0 | 6;20;34;44;53;57  |     6 |    20 |    34 |    44 |    53 |    57 |
| 2026-01-24    |     2964 |              0 |                   0 | 3;9;15;17;30;60   |     3 |     9 |    15 |    17 |    30 |    60 |
| 2026-01-27    |     2965 |              0 |                   0 | 1;20;22;23;35;57  |     1 |    20 |    22 |    23 |    35 |    57 |
| 2026-01-29    |     2966 |              0 |                   0 | 6;7;9;43;44;53    |     6 |     7 |     9 |    43 |    44 |    53 |
| 2026-01-31    |     2967 |              0 |                   0 | 1;6;38;47;56;60   |     1 |     6 |    38 |    47 |    56 |    60 |
| 2026-02-03    |     2968 |              0 |                   0 | 10;11;22;26;36;46 |    10 |    11 |    22 |    26 |    36 |    46 |
| 2026-02-05    |     2969 |              1 |           141844706 | 1;2;5;14;18;32    |     1 |     2 |     5 |    14 |    18 |    32 |
| 2026-02-07    |     2970 |              0 |                   0 | 22;32;37;41;42;59 |    22 |    32 |    37 |    41 |    42 |    59 |

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
| 2026-02-07    |     1174 |              0 |                   0 | 2;8;15;22;23;25;30 |     2 |     8 |    15 |    22 |    23 |    25 |    30 |
