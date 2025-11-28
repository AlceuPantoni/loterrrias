# Resultado do Último Concurso

Utilize esta função para receber um conjunto de dados contendo todos o
resultado do último concurso do produto escolhido.

## Usage

``` r
resultado_ultimo_concurso(produto = "megasena")
```

## Arguments

- produto:

  Nome do jogo das Loterias que deseja atualizar a base. Caso não
  informado, por padrão será a Megasena [megasena](megasena.md).
  Produtos disponíveis:

  - Megasena -\> digite 'megasena' [megasena](megasena.md)

  - Lotofácil -\> digite 'lotofacil' [lotofacil](lotofacil.md)

  - Quina -\> digite 'quina' [quina](quina.md)

  - Lotomania -\> digite 'lotomania' [lotomania](lotomania.md)

  - Timemania -\> digite 'timemania' [timemania](timemania.md)

  - Super Sete -\> digite 'supersete' [supersete](supersete.md)

  - Dia de Sorte -\> digite 'diadesorte' [diadesorte](diadesorte.md)

## Value

Uma `tibble` - a quantidade de variáveis depende do produto.

## Details

**Importante**: o pacote atualiza as bases diariamente no repositório do
GitHub, porém, sua base local permanece com os dados do momento em que o
pacote foi instalado. Caso tenha intenção de usar as bases diretamente,
sem chamar as funções, reinstale o pacote para obter as bases mais
recentes.

## Examples

``` r
# Visualizar concurso, números sorteados e se houve ganhador referente ao
# resultado do concurso mais recente da Megasena
resultado_ultimo_concurso(produto = 'megasena') |>
   dplyr::select(concurso, numeros_sorteados, houve_ganhador)
#> # A tibble: 1 × 3
#>   concurso numeros_sorteados houve_ganhador
#>      <dbl> <chr>                      <dbl>
#> 1     2944 8;15;23;39;40;59               0
```
