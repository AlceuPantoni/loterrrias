# Dia de Sorte

Conjunto de dados contendo todos os resultados do produto das Loterias
chamado Dia de Sorte.

## Usage

``` r
diadesorte
```

## Format

Uma tibble contendo 9 variávies.

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

## Source

Site da Loteria Federal
<https://loterias.caixa.gov.br/Paginas/Dia-de-Sorte.aspx>

## Note

Números em ordem crescente e não na ordem em que foram sorteados.
