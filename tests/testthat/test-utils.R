# Testando a função que valida os nomes de produtos -----------------------

testthat::test_that(
  'A funcao recebe um texto com maiusculas, caracteres especiais e acentos e
  consegue encontrar o nome do produto, caso o valor digitado seja o produto',
  {
    testthat::expect_equal(
      loterrrias:::validar_produto('Loto-fácil'),
      'lotofacil'
    )
  }
)

testthat::test_that(
  'A funcao recebe um texto com maiusculas, caracteres especiais e acentos e
  consegue encontrar o nome do produto, caso o valor digitado seja o produto',
  {
    testthat::expect_equal(
      loterrrias:::validar_produto('Mega Sena'),
      'megasena'
    )
  }
)

testthat::test_that(
  'A funcao recebe um texto com maiusculas, caracteres especiais e acentos e
  consegue encontrar o nome do produto, caso o valor digitado seja o produto',
  {
    testthat::expect_equal(
      loterrrias:::validar_produto('DIA_DE_SORTE'),
      'diadesorte'
    )
  }
)

testthat::test_that(
  'A funcao recebe um texto com maiusculas, caracteres especiais e acentos e
  consegue encontrar o nome do produto, caso o valor digitado seja o produto',
  {
    testthat::expect_equal(
      loterrrias:::validar_produto('DIA_DE_SORTE'),
      'diadesorte'
    )
  }
)

testthat::test_that(
  'A funcao apresenta erro ao receber um nome de produto que nao existe',
  {
    testthat::expect_error(
      loterrrias:::validar_produto('nao_existe')
    )
  }
)

testthat::test_that(
  'A funcao apresenta erro quando nao se informa um nome de produto',
  {
    testthat::expect_error(
      loterrrias:::validar_produto()
    )
  }
)

testthat::test_that(
  'A funcao apresenta erro quando o parametro informado esta nulo',
  {
    p <- NULL
    testthat::expect_error(
      loterrrias:::validar_produto(produto = p)
    )
  }
)

# Testando a função que valida o numero de concurso -----------------------

testthat::test_that(
  'A funcao recebe numero maior que zero e retorna TRUE para a validacao',
  {
    testthat::expect_true(
      loterrrias:::validar_concurso(5)
    )
  }
)

testthat::test_that(
  'A funcao recebe o numero zero e apresenta erro',
  {
    testthat::expect_error(
      loterrrias:::validar_concurso(0)
    )
  }
)

testthat::test_that(
  'A funcao recebe um numero negativo e apresenta erro',
  {
    testthat::expect_error(
      loterrrias:::validar_concurso(numero_concurso = -1)
    )
  }
)

testthat::test_that(
  'A funcao recebe uma string ao inves de um numero e apresenta erro',
  {
    testthat::expect_error(
      loterrrias:::validar_concurso(numero_concurso = -'texto_qualquer')
    )
  }
)

testthat::test_that(
  'A funcao nao recebe parametro e apresenta erro',
  {
    testthat::expect_error(
      loterrrias:::validar_concurso()
    )
  }
)

testthat::test_that(
  'A funcao recebe um parametro nulo e apresenta erro',
  {
    p <- NULL
    testthat::expect_error(
      loterrrias:::validar_concurso(numero_concurso = p)
    )
  }
)

# Testando a função que faz limpeza nos textos digitados ------------------

testthat::test_that(
  'A funcao recebe um texto com maiusculas, caracteres especiais e acentos e
  faz a limpeza do valor, deixando tudo em minusculas, sem espacos e caracteres
  especiais',
  {
    testthat::expect_equal(
      loterrrias:::ajustar_texto('_Loto_-FÁCIL-'),
      'lotofacil'
    )
  }
)
