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
| Mega-sena    | 1996-03-11             |                 2993 |                               651 |                    0.22 |      27282623.3 |    289420865 |    348732.75 |                   17958 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3655 |                              3210 |                    0.88 |        997193.0 |      8252873 |     10712.22 |                   54825 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6995 |                              2634 |                    0.38 |       3632578.3 |    579215957 |     14230.37 |                   34975 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2908 |                               709 |                    0.24 |       2596079.6 |     37261930 |    109348.66 |                   58160 |                   43 |                    96 |
| Timemania    | 2008-03-01             |                 2377 |                                79 |                    0.03 |      26090570.6 |    818652938 |    164711.44 |                   16639 |                   21 |                    53 |
| Super Sete   | 2020-10-02             |                  831 |                                32 |                    0.04 |       3179529.6 |     10146164 |    124747.77 |                    5817 |                    7 |                     1 |
| Dia de Sorte | 2018-05-19             |                 1198 |                               363 |                    0.30 |        839903.9 |      4872572 |     59101.35 |                    8386 |                   10 |                     1 |

Para obter todos os resultados de um determinado produto:

``` r
mega_sena <- loterrrias::resultado_todos(produto = 'megasena')

mega_sena |> 
  tail(10) |> 
  knitr::kable()
```

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | numeros_sorteados | num_1 | num_2 | num_3 | num_4 | num_5 | num_6 |
|:--------------|---------:|---------------:|--------------------:|:------------------|------:|------:|------:|------:|------:|------:|
| 2026-03-14    |     2984 |              0 |                   0 | 6;11;15;28;42;60  |     6 |    11 |    15 |    28 |    42 |    60 |
| 2026-03-17    |     2985 |              1 |            34856053 | 6;8;21;32;41;60   |     6 |     8 |    21 |    32 |    41 |    60 |
| 2026-03-19    |     2986 |              0 |                   0 | 1;5;13;26;41;53   |     1 |     5 |    13 |    26 |    41 |    53 |
| 2026-03-21    |     2987 |              0 |                   0 | 16;17;20;28;46;47 |    16 |    17 |    20 |    28 |    46 |    47 |
| 2026-03-24    |     2988 |              0 |                   0 | 21;23;28;36;57;58 |    21 |    23 |    28 |    36 |    57 |    58 |
| 2026-03-26    |     2989 |              0 |                   0 | 6;14;28;31;56;59  |     6 |    14 |    28 |    31 |    56 |    59 |
| 2026-03-28    |     2990 |              1 |            37983332 | 6;14;18;29;30;44  |     6 |    14 |    18 |    29 |    30 |    44 |
| 2026-03-31    |     2991 |              0 |                   0 | 4;14;19;23;36;53  |     4 |    14 |    19 |    23 |    36 |    53 |
| 2026-04-04    |     2992 |              0 |                   0 | 4;17;23;33;36;49  |     4 |    17 |    23 |    33 |    36 |    49 |
| 2026-04-07    |     2993 |              0 |                   0 | 3;15;31;42;43;51  |     3 |    15 |    31 |    42 |    43 |    51 |

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
| 2026-04-07    |     1198 |              0 |                   0 | 2;6;13;15;20;27;31 |     2 |     6 |    13 |    15 |    20 |    27 |    31 |
