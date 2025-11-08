# Lotomania

Conjunto de dados contendo todos os resultados do produto das Loterias
chamado Lotomania.

## Usage

``` r
lotomania
```

## Format

Uma tibble contendo 22 variaveis.

- **data_apuracao** Data do sorteio (date)

- **concurso** Numero do concurso (numeric)

- **houve_ganhador** Flag indicando se houve ganhador do prêmio máximo
  no concurso \<0 ou 1\> (numeric)

- **valor_premio_maximo** Valor total do prêmio máximo do concurso, caso
  exista ganhador (numeric)

- **numeros_sorteados** Todos os números sorteados, separados por ponto
  e vírgula (character)

- **num_1** Primeira dezena do sorteio (numeric)

- **num_2** Segunda dezena do sorteio (numeric)

- **num_3** Terceira dezena do sorteio (numeric)

- **num_4** Quarta dezena do sorteio (numeric)

- **num_5** Quinta dezena do sorteio (numeric)

- **num_6** Sexta dezena do sorteio (numeric)

- **num_7** Sétima dezena do sorteio (numeric)

- **num_8** Oitava dezena do sorteio (numeric)

- **num_9** Nona dezena do sorteio (numeric)

- **num_10** Décima dezena do sorteio (numeric)

- **num_11** Décima primeira dezena do sorteio (numeric)

- **num_12** Décima segunda dezena do sorteio (numeric)

- **num_13** Décima terceira dezena do sorteio (numeric)

- **num_14** Décima quarta dezena do sorteio (numeric)

- **num_15** Décima quinta dezena do sorteio (numeric)

- **num_16** Décima sexta dezena do sorteio (numeric)

- **num_17** Décima sétima dezena do sorteio (numeric)

- **num_18** Décima oitava dezena do sorteio (numeric)

- **num_19** Décima nona dezena do sorteio (numeric)

- **num_20** Vigésima dezena do sorteio (numeric)

## Source

Site da Loteria Federal
<https://loterias.caixa.gov.br/Paginas/Lotomania.aspx>

## Note

Números em ordem crescente e não na ordem em que foram sorteados.
