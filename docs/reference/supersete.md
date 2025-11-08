# Super Sete

Conjunto de dados contendo todos os resultados do produto das Loterias
chamado Super Sete.

## Usage

``` r
supersete
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

- **num_1** Dezena da primeira coluna (numeric)

- **num_2** Dezena da segunda coluna (numeric)

- **num_3** Dezena da terceira coluna (numeric)

- **num_4** Dezena da quarta coluna (numeric)

- **num_5** Dezena da quinta coluna (numeric)

- **num_6** Dezena da sexta coluna (numeric)

- **num_7** Dezena da sétima coluna (numeric)

## Source

Site da Loteria Federal
<https://loterias.caixa.gov.br/Paginas/Super-Sete.aspx>

## Note

Para este produto a ordem dos números é a ordem do sorteio. Para ganhar,
é necessário acertar o número de cada coluna.
