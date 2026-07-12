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
| Mega-sena | 1996-03-11 | 3030 | 657 | 0.22 | 27658918.1 | 289420865 | 348732.75 | 18180 | 10 | 26 |
| Lotofácil | 2003-09-29 | 3733 | 3269 | 0.88 | 1004364.7 | 8252873 | 10712.22 | 55995 | 20 | 16 |
| Quina | 1994-03-13 | 7063 | 2641 | 0.37 | 3663843.2 | 579215957 | 14230.37 | 35315 | 4 | 47 |
| Lotomania | 1999-10-02 | 2948 | 718 | 0.24 | 2620629.6 | 37261930 | 109348.66 | 58960 | 43 | 96 |
| Timemania | 2008-03-01 | 2414 | 80 | 0.03 | 26191777.3 | 818652938 | 164711.44 | 16898 | 21 | 53 |
| Super Sete | 2020-10-02 | 871 | 33 | 0.04 | 3300658.6 | 10146164 | 124747.77 | 6097 | 5 | 1 |
| Dia de Sorte | 2018-05-19 | 1243 | 372 | 0.30 | 842817.2 | 4872572 | 59101.35 | 8701 | 10 | 1 |

Para obter todos os resultados de um determinado produto:

``` r

mega_sena <- loterrrias::resultado_todos(produto = 'megasena')

mega_sena |> 
  tail(10) |> 
  knitr::kable()
```

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | numeros_sorteados | num_1 | num_2 | num_3 | num_4 | num_5 | num_6 |
|:---|---:|---:|---:|:---|---:|---:|---:|---:|---:|---:|
| 2026-06-20 | 3021 | 1 | 39427096 | 16;19;22;24;46;58 | 16 | 19 | 22 | 24 | 46 | 58 |
| 2026-06-23 | 3022 | 1 | 2813548 | 2;3;8;11;17;22 | 2 | 3 | 8 | 11 | 17 | 22 |
| 2026-06-25 | 3023 | 0 | 0 | 22;25;30;31;39;60 | 22 | 25 | 30 | 31 | 39 | 60 |
| 2026-06-27 | 3024 | 0 | 0 | 13;39;42;44;47;49 | 13 | 39 | 42 | 44 | 47 | 49 |
| 2026-06-30 | 3025 | 0 | 0 | 7;14;16;21;33;58 | 7 | 14 | 16 | 21 | 33 | 58 |
| 2026-07-02 | 3026 | 0 | 0 | 14;19;42;45;48;54 | 14 | 19 | 42 | 45 | 48 | 54 |
| 2026-07-04 | 3027 | 0 | 0 | 6;15;16;24;34;47 | 6 | 15 | 16 | 24 | 34 | 47 |
| 2026-07-07 | 3028 | 0 | 0 | 2;10;11;25;51;56 | 2 | 10 | 11 | 25 | 51 | 56 |
| 2026-07-09 | 3029 | 1 | 43068394 | 1;11;24;33;35;59 | 1 | 11 | 24 | 33 | 35 | 59 |
| 2026-07-11 | 3030 | 0 | 0 | 6;11;25;45;48;58 | 6 | 11 | 25 | 45 | 48 | 58 |

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
| 2026-07-11 | 1243 | 0 | 0 | 6;11;18;25;26;29;30 | 6 | 11 | 18 | 25 | 26 | 29 | 30 |
