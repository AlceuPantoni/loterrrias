testthat::test_that(
  'A funcao historico_resumido_produtos funciona e o retorno possui linhas',
  {
    testthat::expect_gt(
      nrow(loterrrias::historico_resumido_produtos()),
      0
    )
  }
)


testthat::test_that(
  'A funcao historico_resumido_produtos funciona e o retorno possui 11 colunas',
  {
    testthat::expect_equal(
      ncol(loterrrias::historico_resumido_produtos()),
      11
    )
  }
)

testthat::test_that(
  'A funcao historico_resumido_produtos funciona e retorna corretamente todos
  os produtos',
  {
    # valores de referência
    ref <- c("Mega-sena", "Lotof\u00E1cil", "Quina", "Lotomania", "Timemania",
             "Super Sete", "Dia de Sorte") |>
      sort()

    df <- loterrrias::produtos_existentes()

    produtos <- df$nome_produto |>
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
