## Preparação das bases de dados de todos os produtos

devtools::load_all()

httr::set_config(httr::config(ssl_verifypeer = FALSE))

raw_atualizar_dados <- function(produto){

  file <- glue::glue("data-raw/resultados_{produto}.xlsx")

  df <- NULL

  if(file.exists(file)){
    df <- readxl::read_xlsx(file)
  }

  temp <- loterrrias:::atualizar_base(
    df_resultados = df,
    produto = produto,
    verbose = TRUE
  )

  df <- rbind(df, temp)

  rm(temp)

  writexl::write_xlsx(df, file)

  df <- loterrrias:::ajustar_base(df, produto)

  return(df)
}

lotofacil <- raw_atualizar_dados('lotofacil')
megasena <- raw_atualizar_dados('megasena')
quina <- raw_atualizar_dados('quina')
lotomania <- raw_atualizar_dados('lotomania')
timemania <- raw_atualizar_dados('timemania')
supersete <- raw_atualizar_dados('supersete')
diadesorte <- raw_atualizar_dados('diadesorte')

usethis::use_data(lotofacil, overwrite = TRUE)
usethis::use_data(megasena, overwrite = TRUE)
usethis::use_data(quina, overwrite = TRUE)
usethis::use_data(lotomania, overwrite = TRUE)
usethis::use_data(timemania, overwrite = TRUE)
usethis::use_data(supersete, overwrite = TRUE)
usethis::use_data(diadesorte, overwrite = TRUE)

rmarkdown::render("README.Rmd")

pkgdown::build_site()
