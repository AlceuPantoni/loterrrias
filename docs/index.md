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
| 2026-11-24 | 3090 | 0 | 0 | 10;14;27;28;47;57 | 10 | 14 | 27 | 28 | 47 | 57 |
| 2026-11-22 | 3089 | 0 | 0 | 17;18;27;36;58;59 | 17 | 18 | 27 | 36 | 58 | 59 |
| 2026-11-19 | 3088 | 0 | 0 | 10;21;24;28;34;44 | 10 | 21 | 24 | 28 | 34 | 44 |
| 2026-11-17 | 3087 | 0 | 0 | 6;10;23;25;48;50 | 6 | 10 | 23 | 25 | 48 | 50 |
| 2026-11-15 | 3086 | 0 | 0 | 3;20;35;38;43;46 | 3 | 20 | 35 | 38 | 43 | 46 |
| 2026-11-12 | 3085 | 0 | 0 | 10;27;29;37;39;59 | 10 | 27 | 29 | 37 | 39 | 59 |
| 2026-11-10 | 3084 | 1 | 3287950 | 6;14;22;30;31;37 | 6 | 14 | 22 | 30 | 31 | 37 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r

loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:---|:---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Mega-sena | 1996-03-11 | 3090 | 664 | 0.21 | 28444018.4 | 324898792 | 348732.75 | 18540 | 10 | 26 |
| Lotofácil | 2003-09-29 | 3837 | 3341 | 0.87 | 1025533.2 | 14264457 | 10712.22 | 57555 | 20 | 16 |
| Quina | 1994-03-13 | 7172 | 2652 | 0.37 | 3704356.3 | 579215957 | 14230.37 | 35860 | 4 | 47 |
| Lotomania | 1999-10-02 | 3002 | 724 | 0.24 | 2654190.2 | 37261930 | 109348.66 | 60040 | 43 | 96 |
| Timemania | 2008-03-01 | 2472 | 80 | 0.03 | 26191777.3 | 818652938 | 164711.44 | 17304 | 21 | 53 |
| Super Sete | 2020-10-02 | 910 | 33 | 0.04 | 3300658.6 | 10146164 | 124747.77 | 6370 | 5 | 8 |
| Dia de Sorte | 2018-05-19 | 1355 | 392 | 0.29 | 847161.8 | 4872572 | 59101.35 | 9485 | 10 | 1 |
