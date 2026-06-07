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
| 2026-06-06 | 3015 | 1 | 30424768 | 9;18;26;31;53;58 | 9 | 18 | 26 | 31 | 53 | 58 |
| 2026-06-02 | 3014 | 0 | 0 | 27;30;35;40;44;58 | 27 | 30 | 35 | 40 | 44 | 58 |
| 2026-05-30 | 3013 | 0 | 0 | 2;14;21;22;34;44 | 2 | 14 | 21 | 22 | 34 | 44 |
| 2026-05-28 | 3012 | 0 | 0 | 5;7;17;41;42;49 | 5 | 7 | 17 | 41 | 42 | 49 |
| 2026-05-26 | 3011 | 0 | 0 | 2;5;27;36;40;60 | 2 | 5 | 27 | 36 | 40 | 60 |
| 2026-05-24 | 3010 | 1 | 168170027 | 3;30;33;35;45;47 | 3 | 30 | 33 | 35 | 45 | 47 |
| 2026-05-16 | 3009 | 0 | 0 | 4;6;8;18;21;30 | 4 | 6 | 8 | 18 | 21 | 30 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r

loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:---|:---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Mega-sena | 1996-03-11 | 3015 | 654 | 0.22 | 27655352.0 | 289420865 | 348732.75 | 18090 | 10 | 26 |
| Lotofácil | 2003-09-29 | 3704 | 3246 | 0.88 | 1002130.3 | 8252873 | 10712.22 | 55560 | 20 | 16 |
| Quina | 1994-03-13 | 7044 | 2639 | 0.37 | 3652469.4 | 579215957 | 14230.37 | 35220 | 4 | 47 |
| Lotomania | 1999-10-02 | 2933 | 715 | 0.24 | 2615706.5 | 37261930 | 109348.66 | 58660 | 43 | 96 |
| Timemania | 2008-03-01 | 2400 | 79 | 0.03 | 26090570.6 | 818652938 | 164711.44 | 16800 | 21 | 53 |
| Super Sete | 2020-10-02 | 856 | 33 | 0.04 | 3300658.6 | 10146164 | 124747.77 | 5992 | 7 | 1 |
| Dia de Sorte | 2018-05-19 | 1222 | 368 | 0.30 | 843668.1 | 4872572 | 59101.35 | 8554 | 10 | 1 |
