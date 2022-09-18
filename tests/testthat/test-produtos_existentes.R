testthat::test_that(
  'A funcao produtos_existentes funciona e o retorno possui linhas',
  {
    testthat::expect_gt(
      nrow(loterrrias::produtos_existentes()),
      0
    )
  }
)

testthat::test_that(
  'A funcao produtos_existentes funciona e o retorno possui 3 colunas',
  {
    testthat::expect_equal(
      ncol(loterrrias::produtos_existentes()),
      3
    )
  }
)

testthat::test_that(
  'A funcao produtos_existentes funciona e retorna corretamente todos os produtos',
  {
    # valores de referência
    ref <- c("megasena", "lotofacil", "quina", "lotomania", "timemania",
             "supersete", "diadesorte") |>
      sort()

    df <- loterrrias::produtos_existentes()

    produtos <- df$parametro_produto |>
      sort()

    check <- TRUE

    for(x in ref){
      if(! x %in% produtos){
        check <- FALSE
      }
    }

    rm(ref, df, produtos, x)

    testthat::expect_true(
      check
    )
  }
)
