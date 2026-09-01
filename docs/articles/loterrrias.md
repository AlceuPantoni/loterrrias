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
|:---|:---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Mega-sena | 1996-03-11 | 3051 | 660 | 0.22 | 27874460.4 | 289420865 | 348732.75 | 18306 | 10 | 26 |
| Lotofácil | 2003-09-29 | 3776 | 3296 | 0.87 | 1012095.5 | 14264457 | 10712.22 | 56640 | 20 | 16 |
| Quina | 1994-03-13 | 7106 | 2645 | 0.37 | 3678617.2 | 579215957 | 14230.37 | 35530 | 4 | 47 |
| Lotomania | 1999-10-02 | 2970 | 720 | 0.24 | 2637930.8 | 37261930 | 109348.66 | 59400 | 43 | 96 |
| Timemania | 2008-03-01 | 2435 | 80 | 0.03 | 26191777.3 | 818652938 | 164711.44 | 17045 | 21 | 53 |
| Super Sete | 2020-10-02 | 893 | 33 | 0.04 | 3300658.6 | 10146164 | 124747.77 | 6251 | 5 | 8 |
| Dia de Sorte | 2018-05-19 | 1286 | 380 | 0.30 | 835178.9 | 4872572 | 59101.35 | 9002 | 10 | 1 |

Para obter todos os resultados de um determinado produto:

``` r

mega_sena <- loterrrias::resultado_todos(produto = 'megasena')

mega_sena |> 
  tail(10) |> 
  knitr::kable()
```

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | numeros_sorteados | num_1 | num_2 | num_3 | num_4 | num_5 | num_6 |
|:---|---:|---:|---:|:---|---:|---:|---:|---:|---:|---:|
| 2026-08-09 | 3042 | 1 | 164895646 | 2;5;10;35;40;53 | 2 | 5 | 10 | 35 | 40 | 53 |
| 2026-08-11 | 3043 | 1 | 3077413 | 10;11;16;37;42;53 | 10 | 11 | 16 | 37 | 42 | 53 |
| 2026-08-13 | 3044 | 0 | 0 | 4;15;17;40;55;58 | 4 | 15 | 17 | 40 | 55 | 58 |
| 2026-08-16 | 3045 | 0 | 0 | 23;29;33;42;43;57 | 23 | 29 | 33 | 42 | 43 | 57 |
| 2026-08-18 | 3046 | 0 | 0 | 16;23;24;33;36;52 | 16 | 23 | 24 | 33 | 36 | 52 |
| 2026-08-20 | 3047 | 0 | 0 | 4;18;22;26;31;58 | 4 | 18 | 22 | 26 | 31 | 58 |
| 2026-08-23 | 3048 | 1 | 57261598 | 2;6;27;39;44;50 | 2 | 6 | 27 | 39 | 44 | 50 |
| 2026-08-25 | 3049 | 0 | 0 | 6;13;36;43;53;55 | 6 | 13 | 36 | 43 | 53 | 55 |
| 2026-08-27 | 3050 | 0 | 0 | 11;14;30;38;49;55 | 11 | 14 | 30 | 38 | 49 | 55 |
| 2026-08-30 | 3051 | 0 | 0 | 11;15;20;21;38;48 | 11 | 15 | 20 | 21 | 38 | 48 |

Para obter o resultado de um determinado concurso de um produto:

``` r

quina <- loterrrias::resultado_concurso(produto = 'quina', num_concurso = 1)

quina |> 
  tail(10) |> 
  knitr::kable()
```

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | numeros_sorteados | num_1 | num_2 | num_3 | num_4 | num_5 |
|:---|---:|---:|---:|:---|---:|---:|---:|---:|---:|
| 1994-03-13 | 1 | 1 | 75731225 | 25;45;60;76;79 | 25 | 45 | 60 | 76 | 79 |

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

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | time | numeros_sorteados | num_1 | num_2 | num_3 | num_4 | num_5 | num_6 | num_7 |
|:---|---:|---:|---:|:---|:---|---:|---:|---:|---:|---:|---:|---:|
| 2022-06-28 | 1801 | 0 | 0 | FERROVIARIA/SP | 11;40;46;54;59;60;72 | 11 | 40 | 46 | 54 | 59 | 60 | 72 |
| 2022-06-30 | 1802 | 0 | 0 | MIRASSOL/SP | 1;32;38;51;54;59;65 | 1 | 32 | 38 | 51 | 54 | 59 | 65 |
| 2022-07-02 | 1803 | 0 | 0 | MOTO CLUB/MA | 7;28;31;41;50;59;66 | 7 | 28 | 31 | 41 | 50 | 59 | 66 |
| 2022-07-05 | 1804 | 0 | 0 | MOTO CLUB/MA | 1;47;55;56;57;64;78 | 1 | 47 | 55 | 56 | 57 | 64 | 78 |
| 2022-07-07 | 1805 | 0 | 0 | NAUTICO/PE | 1;7;12;41;55;66;72 | 1 | 7 | 12 | 41 | 55 | 66 | 72 |
| 2022-07-09 | 1806 | 0 | 0 | MANAUS/AM | 30;32;40;44;67;74;77 | 30 | 32 | 40 | 44 | 67 | 74 | 77 |
| 2022-07-12 | 1807 | 0 | 0 | SAMPAIO CORREA/MA | 28;32;39;44;45;67;73 | 28 | 32 | 39 | 44 | 45 | 67 | 73 |
| 2022-07-14 | 1808 | 0 | 0 | ATHLETICO/PR | 34;44;56;59;67;70;77 | 34 | 44 | 56 | 59 | 67 | 70 | 77 |
| 2022-07-16 | 1809 | 0 | 0 | JUVENTUDE/RS | 6;14;17;29;38;62;79 | 6 | 14 | 17 | 29 | 38 | 62 | 79 |
| 2022-07-19 | 1810 | 1 | 55653686 | PONTE PRETA/SP | 11;21;27;37;58;64;65 | 11 | 21 | 27 | 37 | 58 | 64 | 65 |

Para obter o resultado do último concurso de um produto:

``` r

dia_de_sorte <- loterrrias::resultado_ultimo_concurso(produto = 'diadesorte')

dia_de_sorte |> 
  tail(10) |> 
  knitr::kable()
```

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | numeros_sorteados | num_1 | num_2 | num_3 | num_4 | num_5 | num_6 | num_7 |
|:---|---:|---:|---:|:---|---:|---:|---:|---:|---:|---:|---:|
| 2026-08-31 | 1286 | 0 | 0 | 2;4;8;10;12;17;23 | 2 | 4 | 8 | 10 | 12 | 17 | 23 |
