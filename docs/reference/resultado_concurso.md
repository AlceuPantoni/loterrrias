# Resultado de um Concurso Específico

Utilize esta função para receber um conjunto de dados contendo o
resultado de um concurso específico.

## Usage

``` r
resultado_concurso(produto = "megasena", num_concurso)
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

- num_concurso:

  Número do concurso que deseja obter o resultado.

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
# resultado do concurso 1000 da Megasena
resultado_concurso(produto = 'megasena', num_concurso = 1000) |>
   dplyr::select(concurso, numeros_sorteados, houve_ganhador)
#> # A tibble: 1 × 3
#>   concurso numeros_sorteados houve_ganhador
#>      <dbl> <chr>                      <dbl>
#> 1     1000 29;38;39;49;53;58              0
```
