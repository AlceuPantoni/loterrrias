# Testando a função resultado_todos ---------------------------------------

testthat::test_that(
  'A funcao resultado_todos funciona sem parametros',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_todos()),
      0
    )
  }
)

testthat::test_that(
  'A funcao resultado_todos funciona recebendo parametro com maiusculas',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_todos(produto = 'LOTOFACIL')),
      0
    )
  }
)


testthat::test_that(
  'A funcao resultado_todos funciona recebendo parametro com minusculas',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_todos(produto = 'quina')),
      0
    )
  }
)

testthat::test_that(
  'A funcao resultado_todos funciona recebendo parametro com espacos',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_todos(produto = 'super sete')),
      0
    )
  }
)

testthat::test_that(
  'A funcao resultado_todos funciona recebendo parametro com caracteres especiais',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_todos(produto = 'Diá-de_SORTE')),
      0
    )
  }
)

testthat::test_that(
  'A funcao resultado_todos apresenta erro ao informar produto que nao existe',
  {
    testthat::expect_error(
      loterrrias::resultado_todos(produto = 'nao existe')
    )
  }
)


# Testando a função resultado_concurso ------------------------------------

testthat::test_that(
  'A funcao resultado_concurso funciona sem parametros de produto',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_concurso(num_concurso = 1)),
      0
    )
  }
)

testthat::test_that(
  'A funcao resultado_concurso funciona recebendo parametro com maiusculas',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_concurso(produto = 'LOTOFACIL', num_concurso = 1)),
      0
    )
  }
)


testthat::test_that(
  'A funcao resultado_concurso funciona recebendo parametro com minusculas',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_concurso(produto = 'quina', num_concurso = 1)),
      0
    )
  }
)

testthat::test_that(
  'A funcao resultado_concurso funciona recebendo parametro com espacos',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_concurso(produto = 'super sete', num_concurso = 1)),
      0
    )
  }
)

testthat::test_that(
  'A funcao resultado_concurso funciona recebendo parametro com caracteres especiais',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_concurso(produto = 'Dia-de_SORTE', num_concurso = 1)),
      0
    )
  }
)

testthat::test_that(
  'A funcao resultado_concurso apresenta erro ao informar produto que nao existe',
  {
    testthat::expect_error(
      loterrrias::resultado_concurso(produto = 'nao existe', num_concurso = 1)
    )
  }
)

testthat::test_that(
  'A funcao resultado_concurso apresenta erro ao informar concurso que nao existe',
  {
    testthat::expect_error(
      loterrrias::resultado_concurso(num_concurso = -1)
    )
  }
)

testthat::test_that(
  'A funcao resultado_concurso apresenta erro ao informar valor nao numerico para
  o concurso',
  {
    testthat::expect_error(
      loterrrias::resultado_concurso(num_concurso = 'texto')
    )
  }
)

testthat::test_that(
  'A funcao resultado_concurso apresenta erro caso nao sejam informados parametros',
  {
    testthat::expect_error(
      loterrrias::resultado_concurso()
    )
  }
)


# Testando a função resultado_concursos ------------------------------------

testthat::test_that(
  'A funcao resultado_concursos funciona sem parametros de produto',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_concursos(num_concurso_inicial = 1,
                                           num_concurso_final = 2)),
      0
    )
  }
)

testthat::test_that(
  'A funcao resultado_concursos funciona sem parametros de produto e numero de
  concurso final',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_concursos(num_concurso_inicial = 1)),
      0
    )
  }
)

testthat::test_that(
  'A funcao resultado_concursos funciona recebendo parametro com maiusculas',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_concursos(produto = 'LOTOFACIL',
                                          num_concurso_inicial = 1,
                                          num_concurso_final = 2)),
      0
    )
  }
)


testthat::test_that(
  'A funcao resultado_concursos funciona recebendo parametro com minusculas',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_concursos(produto = 'quina',
                                          num_concurso_inicial = 1,
                                          num_concurso_final = 2)),
      0
    )
  }
)

testthat::test_that(
  'A funcao resultado_concursos funciona recebendo parametro com espacos',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_concursos(produto = 'super sete',
                                          num_concurso_inicial = 1,
                                          num_concurso_final = 2)),
      0
    )
  }
)

testthat::test_that(
  'A funcao resultado_concursos funciona recebendo parametro com caracteres especiais',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_concursos(produto = 'Dia-de_SORTE',
                                          num_concurso_inicial = 1,
                                          num_concurso_final = 2)),
      0
    )
  }
)

testthat::test_that(
  'A funcao resultado_concursos apresenta erro ao informar produto que nao existe',
  {
    testthat::expect_error(
      loterrrias::resultado_concursos(produto = 'nao existe',
                                      num_concurso_inicial = 1,
                                      num_concurso_final = 2)
    )
  }
)

testthat::test_that(
  'A funcao resultado_concursos apresenta erro ao informar concurso que nao existe
  no concurso inicial',
  {
    testthat::expect_error(
      loterrrias::resultado_concursos(produto = 'megasena',
                                      num_concurso_inicial = -1,
                                      num_concurso_final = 2)
    )
  }
)

testthat::test_that(
  'A funcao resultado_concursos apresenta erro ao informar concurso que nao existe
  no concurso final',
  {
    testthat::expect_error(
      loterrrias::resultado_concursos(produto = 'megasena',
                                      num_concurso_inicial = 1,
                                      num_concurso_final = -1)
    )
  }
)

testthat::test_that(
  'A funcao resultado_concursos apresenta erro ao informar textos como concurso
  inicial',
  {
    testthat::expect_error(
      loterrrias::resultado_concursos(produto = 'megasena',
                                      num_concurso_inicial = 'texto',
                                      num_concurso_final = 2)
    )
  }
)

testthat::test_that(
  'A funcao resultado_concursos apresenta erro ao informar textos como concurso
  final',
  {
    testthat::expect_error(
      loterrrias::resultado_concursos(produto = 'megasena',
                                      num_concurso_inicial = 1,
                                      num_concurso_final = 'texto')
    )
  }
)

testthat::test_that(
  'A funcao resultado_concursos apresenta erro caso nao seja informado o numero
  de concurso inicial',
  {
    testthat::expect_error(
      loterrrias::resultado_concursos(produto = 'megasena',
                                      num_concurso_final = 5)
    )
  }
)

testthat::test_that(
  'A funcao resultado_concursos apresenta erro caso nao sejam informados parametros
  de concurso',
  {
    testthat::expect_error(
      loterrrias::resultado_concursos(produto = 'megasena')
    )
  }
)


# Testando a função resultado_ultimo_concurso ---------------------------------------

testthat::test_that(
  'A funcao resultado_ultimo_concurso funciona sem parametros',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_ultimo_concurso()),
      0
    )
  }
)

testthat::test_that(
  'A funcao resultado_ultimo_concurso funciona recebendo parametro com maiusculas',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_ultimo_concurso(produto = 'LOTOFACIL')),
      0
    )
  }
)


testthat::test_that(
  'A funcao resultado_ultimo_concurso funciona recebendo parametro com minusculas',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_ultimo_concurso(produto = 'quina')),
      0
    )
  }
)

testthat::test_that(
  'A funcao resultado_ultimo_concurso funciona recebendo parametro com espacos',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_ultimo_concurso(produto = 'super sete')),
      0
    )
  }
)

testthat::test_that(
  'A funcao resultado_ultimo_concurso funciona recebendo parametro com caracteres especiais',
  {
    testthat::expect_gt(
      nrow(loterrrias::resultado_ultimo_concurso(produto = 'Diá-de_SORTE')),
      0
    )
  }
)

testthat::test_that(
  'A funcao resultado_ultimo_concurso apresenta erro ao informar produto que nao existe',
  {
    testthat::expect_error(
      loterrrias::resultado_ultimo_concurso(produto = 'nao existe')
    )
  }
)
