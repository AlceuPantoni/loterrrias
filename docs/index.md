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
| 2026-07-09 | 3029 | 1 | 43068394 | 1;11;24;33;35;59 | 1 | 11 | 24 | 33 | 35 | 59 |
| 2026-07-07 | 3028 | 0 | 0 | 2;10;11;25;51;56 | 2 | 10 | 11 | 25 | 51 | 56 |
| 2026-07-04 | 3027 | 0 | 0 | 6;15;16;24;34;47 | 6 | 15 | 16 | 24 | 34 | 47 |
| 2026-07-02 | 3026 | 0 | 0 | 14;19;42;45;48;54 | 14 | 19 | 42 | 45 | 48 | 54 |
| 2026-06-30 | 3025 | 0 | 0 | 7;14;16;21;33;58 | 7 | 14 | 16 | 21 | 33 | 58 |
| 2026-06-27 | 3024 | 0 | 0 | 13;39;42;44;47;49 | 13 | 39 | 42 | 44 | 47 | 49 |
| 2026-06-25 | 3023 | 0 | 0 | 22;25;30;31;39;60 | 22 | 25 | 30 | 31 | 39 | 60 |

Neste outro caso de uso, temos um resumo histórico de todos os produtos
das Loterias da Caixa disponíveis no pacote.

``` r

loterrrias::historico_resumido_produtos() |> 
  knitr::kable()
```

| nome_produto | data_primeiro_concurso | quantidade_concursos | quantidade_concursos_com_ganhador | percentual_com_ganhador | media_premiacao | maior_premio | menor_premio | total_dezenas_sorteadas | numero_mais_sorteado | numero_menos_sorteado |
|:---|:---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Mega-sena | 1996-03-11 | 3029 | 657 | 0.22 | 27658918.1 | 289420865 | 348732.75 | 18174 | 10 | 26 |
| Lotofácil | 2003-09-29 | 3731 | 3267 | 0.88 | 1004478.7 | 8252873 | 10712.22 | 55965 | 20 | 16 |
| Quina | 1994-03-13 | 7061 | 2640 | 0.37 | 3661162.9 | 579215957 | 14230.37 | 35305 | 4 | 47 |
| Lotomania | 1999-10-02 | 2947 | 717 | 0.24 | 2618586.8 | 37261930 | 109348.66 | 58940 | 43 | 96 |
| Timemania | 2008-03-01 | 2413 | 80 | 0.03 | 26191777.3 | 818652938 | 164711.44 | 16891 | 21 | 53 |
| Super Sete | 2020-10-02 | 870 | 33 | 0.04 | 3300658.6 | 10146164 | 124747.77 | 6090 | 5 | 8 |
| Dia de Sorte | 2018-05-19 | 1241 | 372 | 0.30 | 842817.2 | 4872572 | 59101.35 | 8687 | 10 | 1 |
