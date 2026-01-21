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
| Mega-sena    | 1996-03-11             |                 2962 |                               647 |                    0.22 |      26875215.2 |    289420865 |    348732.75 |                   17772 |                   10 |                    26 |
| Lotofácil    | 2003-09-29             |                 3592 |                              3160 |                    0.88 |        989279.9 |      8252873 |     10712.22 |                   53880 |                   20 |                    16 |
| Quina        | 1994-03-13             |                 6932 |                              2625 |                    0.38 |       3612062.2 |    579215957 |     14230.37 |                   34660 |                    4 |                    47 |
| Lotomania    | 1999-10-02             |                 2877 |                               707 |                    0.25 |       2594572.2 |     37261930 |    109348.66 |                   57540 |                   43 |                    96 |
| Timemania    | 2008-03-01             |                 2345 |                                79 |                    0.03 |      26090570.6 |    818652938 |    164711.44 |                   16415 |                   21 |                    53 |
| Super Sete   | 2020-10-02             |                  800 |                                32 |                    0.04 |       3179529.6 |     10146164 |    124747.77 |                    5600 |                    7 |                     8 |
| Dia de Sorte | 2018-05-19             |                 1166 |                               358 |                    0.31 |        828136.6 |      4872572 |     59101.35 |                    8162 |                   10 |                     1 |

Para obter todos os resultados de um determinado produto:

``` r
mega_sena <- loterrrias::resultado_todos(produto = 'megasena')

mega_sena |> 
  tail(10) |> 
  knitr::kable()
```

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | numeros_sorteados | num_1 | num_2 | num_3 | num_4 | num_5 | num_6 |
|:--------------|---------:|---------------:|--------------------:|:------------------|------:|------:|------:|------:|------:|------:|
| 2025-12-18    |     2953 |              0 |                   0 | 5;10;24;25;47;54  |     5 |    10 |    24 |    25 |    47 |    54 |
| 2025-12-20    |     2954 |              0 |                   0 | 1;9;37;39;42;44   |     1 |     9 |    37 |    39 |    42 |    44 |
| 2026-01-01    |     2955 |              1 |           181892881 | 9;13;21;32;33;59  |     9 |    13 |    21 |    32 |    33 |    59 |
| 2026-01-06    |     2956 |              0 |                   0 | 10;18;21;24;43;47 |    10 |    18 |    21 |    24 |    43 |    47 |
| 2026-01-08    |     2957 |              0 |                   0 | 19;28;36;37;48;52 |    19 |    28 |    36 |    37 |    48 |    52 |
| 2026-01-10    |     2958 |              0 |                   0 | 7;9;14;35;42;49   |     7 |     9 |    14 |    35 |    42 |    49 |
| 2026-01-13    |     2959 |              0 |                   0 | 18;26;35;41;44;45 |    18 |    26 |    35 |    41 |    44 |    45 |
| 2026-01-15    |     2960 |              0 |                   0 | 3;13;15;16;46;47  |     3 |    13 |    15 |    16 |    46 |    47 |
| 2026-01-17    |     2961 |              0 |                   0 | 10;13;55;56;59;60 |    10 |    13 |    55 |    56 |    59 |    60 |
| 2026-01-20    |     2962 |              0 |                   0 | 6;29;33;38;53;56  |     6 |    29 |    33 |    38 |    53 |    56 |

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

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | numeros_sorteados | num_1 | num_2 | num_3 | num_4 | num_5 | num_6 | num_7 |
|:--------------|---------:|---------------:|--------------------:|:------------------|------:|------:|------:|------:|------:|------:|------:|
| 2026-01-20    |     1166 |              0 |                   0 | 1;7;8;15;16;24;31 |     1 |     7 |     8 |    15 |    16 |    24 |    31 |
