#' Atualizar Base de Resultados
#'
#' @details
#' Esta função deve ser utilizada para atualizar a base local de resultados.
#' O pacote atualiza diariamente a base de resultados, portanto, que faz a
#' instalação do mesmo, sempre recebe uma base atualizada, porém, após instalá-lo,
#' é necessário que faça a atualização da base sempre que julgar necessário.
#'
#' @param produto Nome do jogo das Loterias que deseja atualizar a base.
#' Produtos disponíveis:
#' * Megasena -> digite 'megasena' [megasena]
#' * Lotofácil -> digite 'lotofacil' [lotofacil]
#' * Quina -> digite 'quina' [quina]
#' * Lotomania -> digite 'lotomania' [lotomania]
#' * Timemania -> digite 'timemania' [timemania]
#' * Super Sete -> digite 'supersete' [supersete]
#' * Dia de Sorte -> digite 'diadesorte' [diadesorte]
#'
#' @return Uma \code{tibble} - a quantidade de variáveis depende do produto.
#' @export
atualizar_base_resultados <- function(produto = 'megasena'){

  resultados <- base_produto_escolhido(produto)

  path <- glue::glue('data/{produto}.rda')

  gravar_dataset(
    df = resultados,
    file = path,
    produto = produto
  )
}


# Funcoes auxiliares ------------------------------------------------------

base_produto_escolhido <- function(produto){
  if(produto == 'megasena'){
    resultados <- loterrrias::megasena
  }
  else if(produto == 'lotofacil'){
    resultados <- loterrrias::lotofacil
  }
  else if(produto == 'lotomania'){
    resultados <- loterrrias::lotomania
  }
  else if(produto == 'quina'){
    resultados <- loterrrias::quina
  }
  else if(produto == 'timemania'){
    resultados <- loterrrias::timemania
  }
  else if(produto == 'diadesorte'){
    resultados <- loterrrias::diadesorte
  }
  else if(produto == 'supersete'){
    resultados <- loterrrias::supersete
  }
  else{
    usethis::ui_stop('O produto informado nao existe.
                     Verifique se digitou corretamente.
                     A funcao produtos_existentes() exibe os valores possiveis.')
  }

  return(resultados)
}

# Consolida os dados e grava o dataset atualizado
gravar_dataset <- function(df, file, produto){
  temp <- atualizar_base(df, produto)

  if(nrow(temp) > 0) {
    temp <- ajustar_base(temp, produto)

    df <- rbind(df, temp)

    save(df, file = file, compress = T)

    return(df)
  }
  else{
    usethis::ui_info(
      'O dataset esta atualizado.'
    )
  }
}

# Ajusta a base para o formato Wide
ajustar_base <- function(df_resultados, produto = 'megasena'){
  qtde_numeros <- 6

  switch (produto,
          megasena = {qtde_numeros <- 6},
          lotofacil = {qtde_numeros <- 15},
          quina = {qtde_numeros <- 5},
          lotomania = {qtde_numeros <- 20},
          timemania = {qtde_numeros <- 7},
          diadesorte = {qtde_numeros <- 7},
          supersete = {qtde_numeros <- 7}
  )

  df_resultados$labels_nums <- ''

  if(produto == 'timemania'){
    df_resultados <- df_resultados |>
      dplyr::select(data_apuracao, num_concurso, time, labels_nums, numeros_sorteados)

    tam <- length(df_resultados$num_concurso)

    i <- 1
    for(x in 1:tam){
      df_resultados[x,4] <- paste0('num_',i)
      i <- i+1
      if(i>qtde_numeros){
        i <- 1
      }
    }
  }
  else{
    df_resultados <- df_resultados |>
      dplyr::select(data_apuracao, num_concurso, labels_nums, numeros_sorteados)

    tam <- length(df_resultados$num_concurso)

    i <- 1
    for(x in 1:tam){
      df_resultados[x,3] <- paste0('num_',i)
      i <- i+1
      if(i>qtde_numeros){
        i <- 1
      }
    }
  }

  df_resultados <- df_resultados |>
    tidyr::pivot_wider(
      names_from = "labels_nums",
      values_from = "numeros_sorteados"
    )

  return(df_resultados)
}

# Atualiza os resultados (formato Long)
atualizar_base <- function(df_resultados, produto = 'megasena'){

  if(is.null(df_resultados)){
    concurso <- 1
  } else{
    concurso <- max(df_resultados$num_concurso) + 1
  }

  url_base <- glue::glue(
    "https://servicebus2.caixa.gov.br/portaldeloterias/api/{produto}/"
  )

  resultado_ok <- TRUE

  if(produto == 'timemania'){
    df_final <- data.frame(
      data_apuracao = character(),
      num_concurso = numeric(),
      time = character(),
      numeros_sorteados = numeric(),
      stringsAsFactors = FALSE
    )
  }
  else{
    df_final <- data.frame(
      data_apuracao = character(),
      num_concurso = numeric(),
      numeros_sorteados = numeric(),
      stringsAsFactors = FALSE
    )
  }

  while(resultado_ok){
    resultado_ok = FALSE

    url = paste0(url_base,concurso)

    resposta <- httr::GET(url = url, config = httr::config(ssl_verifypeer = F))

    if(resposta$status_code == 200){
      resultado_ok = TRUE
      em_json <- jsonlite::fromJSON(
        httr::content(resposta, "text", encoding = "UTF-8")
      )

      data_apuracao <- em_json$dataApuracao
      num_concurso <- as.numeric(em_json$numero)

      if(produto == 'supersete'){
        numeros_sorteados <- as.numeric(em_json$dezenasSorteadasOrdemSorteio)
      }
      else{
        numeros_sorteados <- as.numeric(em_json$listaDezenas)
      }

      if(produto == 'timemania'){
        time <- em_json$nomeTimeCoracaoMesSorte
        tmp_df <- data.frame(data_apuracao, num_concurso, time, numeros_sorteados)

        rm(tmp_df, data_apuracao, num_concurso, time, numeros_sorteados, em_json)
      }
      else{
        tmp_df <- data.frame(data_apuracao, num_concurso, numeros_sorteados)
        df_final <- rbind(df_final, tmp_df)

        rm(tmp_df, data_apuracao, num_concurso, numeros_sorteados, em_json)
      }

      usethis::ui_info(glue::glue(
        'Produto: {produto} | Recebido concurso: {concurso}.'
      )
      )
    }
    concurso <- concurso + 1
  }

  rm(concurso, url_base, url, resultado_ok, resposta)

  return(df_final)
}
