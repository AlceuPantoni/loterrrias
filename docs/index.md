# loterrrias

Este pacote tem por objetivo disponilizar os dados de diversos produtos
das Loterias da Caixa.

Os dados foram obtidos diretamente do site das [Loterias da
Caixa](https://loterias.caixa.gov.br/Paginas/default.aspx) através do
uso de técnicas de Web Scraping.

Caso necessário, é possível fazer download das base de dados em formado
**.xlsx** através dos links abaixo:

- ***Dia de Sorte***
  [Dia_de_Sorte`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_diadesorte.xlsx)
- ***Lotofácil***
  [Lotofacil`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_lotofacil.xlsx)
- ***Lotomania***
  [Lotomania`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_lotomania.xlsx)
- ***Mega-Sena***
  [Mega_Sena`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_megasena.xlsx)
- ***Quina***
  [Quina`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_quina.xlsx)
- ***Super Sete***
  [Super_Sete`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_supersete.xlsx)
- ***Timemania***
  [Timemania`.xlsx`](https://raw.githubusercontent.com/AlceuPantoni/loterrrias/main/data-raw/resultados_timemania.xlsx)

## Instalação

O pacote loterrrias pode ser instalado através do
[GitHub](https://github.com/) utilizando o código abaixo em seu R:

``` r

# install.packages("devtools")
devtools::install_github("AlceuPantoni/loterrrias")
```

## Exemplos de uso

Abaixo, como exemplo, segue um dos conjuntos de dados disponíveis,
referente ao produto Mega-Sena.

``` r

loterrrias::resultado_todos(produto = 'megasena') |> 
  dplyr::arrange(desc(concurso)) |> 
  head(7) |> 
  knitr::kable()
```

| data_apuracao | concurso | houve_ganhador | valor_premio_maximo | numeros_sorteados | num_1 | num_2 | num_3 | num_4 | num_5 | num_6 |
|:---|---:|---:|---:|:---|---:|---:|---:|---:|---:|---:|
| 2026-07-28 | 3037 | 0 | 0 | 2;11;22;30;51;54 | 2 | 11 | 22 | 30 | 51 | 54 |
| 2026-07-26 | 3036 | 0 | 0 | 5;12;21;33;43;50 | 5 | 12 | 21 | 33 | 43 | 50 |
| 2026-07-23 | 3035 | 0 | 0 | 5;7;17;51;56;59 | 5 | 7 | 17 | 51 | 56 | 59 |
| 2026-07-21 | 3034 | 0 | 0 | 8;28;30;37;39;60 | 8 | 28 | 30 | 37 | 39 | 60 |
| 2026-07-19 | 3033 | 0 | 0 | 18;21;23;43;55;58 | 18 | 21 | 23 | 43 | 55 | 58 |
| 2026-07-16 | 3032 | 0 | 0 | 8;12;23;27;42;43 | 8 | 12 | 23 | 27 | 42 | 43 |
| 2026-07-14 | 3031 | 0 | 0 | 20;28;32;35;40;54 | 20 | 28 | 32 | 35 | 40 | 54 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r

loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:---|:---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Mega-sena | 1996-03-11 | 3037 | 657 | 0.22 | 27658918.1 | 289420865 | 348732.75 | 18222 | 10 | 26 |
| Lotofácil | 2003-09-29 | 3748 | 3277 | 0.87 | 1008126.6 | 14264457 | 10712.22 | 56220 | 20 | 16 |
| Quina | 1994-03-13 | 7078 | 2643 | 0.37 | 3671498.6 | 579215957 | 14230.37 | 35390 | 4 | 47 |
| Lotomania | 1999-10-02 | 2956 | 719 | 0.24 | 2617649.3 | 37261930 | 109348.66 | 59120 | 43 | 96 |
| Timemania | 2008-03-01 | 2421 | 80 | 0.03 | 26191777.3 | 818652938 | 164711.44 | 16947 | 21 | 53 |
| Super Sete | 2020-10-02 | 879 | 33 | 0.04 | 3300658.6 | 10146164 | 124747.77 | 6153 | 5 | 8 |
| Dia de Sorte | 2018-05-19 | 1258 | 375 | 0.30 | 839723.4 | 4872572 | 59101.35 | 8806 | 10 | 1 |
