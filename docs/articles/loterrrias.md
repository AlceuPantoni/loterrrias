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
| Mega-sena | 1996-03-11 | 3091 | 664 | 0.21 | 28444018.4 | 324898792 | 348732.75 | 18546 | 10 | 26 |
| Lotofácil | 2003-09-29 | 3839 | 3342 | 0.87 | 1025287.5 | 14264457 | 10712.22 | 57585 | 20 | 16 |
| Quina | 1994-03-13 | 7172 | 2652 | 0.37 | 3704356.3 | 579215957 | 14230.37 | 35860 | 4 | 47 |
| Lotomania | 1999-10-02 | 3003 | 724 | 0.24 | 2654190.2 | 37261930 | 109348.66 | 60060 | 43 | 96 |
| Timemania | 2008-03-01 | 2473 | 80 | 0.03 | 26191777.3 | 818652938 | 164711.44 | 17311 | 21 | 53 |
| Super Sete | 2020-10-02 | 910 | 33 | 0.04 | 3300658.6 | 10146164 | 124747.77 | 6370 | 5 | 8 |
| Dia de Sorte | 2018-05-19 | 1357 | 393 | 0.29 | 845065.5 | 4872572 | 23325.03 | 9499 | 10 | 1 |

Para obter todos os resultados de um determinado produto:

``` r

mega_sena <- loterrrias::resultado_todos(produto = 'megasena')

mega_sena |> 
  tail(10) |> 
  knitr::kable()
```

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | numeros_sorteados | num_1 | num_2 | num_3 | num_4 | num_5 | num_6 |
|:---|---:|---:|---:|:---|---:|---:|---:|---:|---:|---:|
| 2026-11-06 | 3082 | 0 | 0 | 4;16;23;24;38;44 | 4 | 16 | 23 | 24 | 38 | 44 |
| 2026-11-08 | 3083 | 1 | 59526904 | 22;25;29;37;46;54 | 22 | 25 | 29 | 37 | 46 | 54 |
| 2026-11-10 | 3084 | 1 | 3287950 | 6;14;22;30;31;37 | 6 | 14 | 22 | 30 | 31 | 37 |
| 2026-11-12 | 3085 | 0 | 0 | 10;27;29;37;39;59 | 10 | 27 | 29 | 37 | 39 | 59 |
| 2026-11-15 | 3086 | 0 | 0 | 3;20;35;38;43;46 | 3 | 20 | 35 | 38 | 43 | 46 |
| 2026-11-17 | 3087 | 0 | 0 | 6;10;23;25;48;50 | 6 | 10 | 23 | 25 | 48 | 50 |
| 2026-11-19 | 3088 | 0 | 0 | 10;21;24;28;34;44 | 10 | 21 | 24 | 28 | 34 | 44 |
| 2026-11-22 | 3089 | 0 | 0 | 17;18;27;36;58;59 | 17 | 18 | 27 | 36 | 58 | 59 |
| 2026-11-24 | 3090 | 0 | 0 | 10;14;27;28;47;57 | 10 | 14 | 27 | 28 | 47 | 57 |
| 2026-11-26 | 3091 | 0 | 0 | 4;19;22;23;28;37 | 4 | 19 | 22 | 23 | 28 | 37 |

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
| 2026-11-26 | 1357 | 0 | 0 | 5;6;8;17;20;26;28 | 5 | 6 | 8 | 17 | 20 | 26 | 28 |
