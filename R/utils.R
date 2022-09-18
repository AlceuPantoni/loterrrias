# Funções auxiliares úteis para demais funções do pacote ------------------

# Validar a string recebido como produto
validar_produto <- function(produto){

  if(missing(produto) || is.null(produto)){
    usethis::ui_info(
      usethis::ui_stop('Produto nao informado ou nulo.
                     Verifique se digitou corretamente.
                     A funcao produtos_existentes() exibe os valores possiveis.')
    )
  }

  prod <- ajustar_texto(produto)

  produtos <- produtos_existentes()
  produtos <- produtos$parametro_produto

  if(!prod %in% produtos){
    usethis::ui_info(
      usethis::ui_stop('O produto informado nao existe.
                     Verifique se digitou corretamente.
                     A funcao produtos_existentes() exibe os valores possiveis.')
    )
  }

  return(prod)
}

# Validar o número de concurso recebido nas funções
validar_concurso <- function(numero_concurso){
  if(missing(numero_concurso) || is.null(numero_concurso)){
    usethis::ui_stop('Concurso nao informado ou nulo.
                   Para esta funcao, informe um concurso.')
  }

  if(!is.numeric(numero_concurso)){
    usethis::ui_stop('Valor de concurso invalido.
                     Concurso deve ser um valor numerico.')
  }

  if(numero_concurso <= 0){
    usethis::ui_stop('Valor de concurso invalido.
                     Concurso deve ser maior que zero.')
  }

  return(TRUE)
}

# Limpar texto para padronizar as strings
ajustar_texto <- function(texto){
  str <- tolower(
    stringi::stri_trans_general(
      stringr::str_replace_all(texto, '[-|_| ]', ''),
      'Latin-ASCII'
    )
  )

  return(str)
}

# Devolver uma base de dados de acordo com o produto
base_produto_escolhido <- function(produto){
  produto <- validar_produto(produto = produto)

  if(produto == 'megasena'){
    resultados <- loterrrias::megasena
  }
  if(produto == 'lotofacil'){
    resultados <- loterrrias::lotofacil
  }
  if(produto == 'lotomania'){
    resultados <- loterrrias::lotomania
  }
  if(produto == 'quina'){
    resultados <- loterrrias::quina
  }
  if(produto == 'timemania'){
    resultados <- loterrrias::timemania
  }
  if(produto == 'diadesorte'){
    resultados <- loterrrias::diadesorte
  }
  if(produto == 'supersete'){
    resultados <- loterrrias::supersete
  }

  return(resultados)
}

# Ajusta a base para o formato Wide
ajustar_base <- function(df_resultados, produto){

  prods_disponiveis <- produtos_existentes() |>
    dplyr::filter(parametro_produto == produto)

  qtde_numeros <- prods_disponiveis$qtde_numeros_sorteio

  df_resultados$labels_nums <- ''

  if(produto == 'timemania'){
    df_resultados <- df_resultados |>
      dplyr::select(data_apuracao, concurso, houve_ganhador, valor_premio_maximo,
                    time, labels_nums, numeros_sorteados)
    coluna_labels <- 6
  }
  else{
    df_resultados <- df_resultados |>
      dplyr::select(data_apuracao, concurso, houve_ganhador, valor_premio_maximo,
                    labels_nums, numeros_sorteados)
    coluna_labels <- 5
  }

  tam <- length(df_resultados$concurso)

  i <- 1
  for(x in 1:tam){
    df_resultados[x,coluna_labels] <- paste0('num_',i)
    i <- i+1
    if(i>qtde_numeros){
      i <- 1
    }
  }

  df_resultados <- df_resultados |>
    tidyr::pivot_wider(
      names_from = "labels_nums",
      values_from = "numeros_sorteados"
    )

  coluna_final <- ncol(df_resultados)
  coluna_inicial <- ncol(df_resultados |>
                           dplyr::select(!dplyr::starts_with("num_"))) + 1

  df_resultados <- df_resultados |>
    tidyr::unite(
      "numeros_sorteados",
      coluna_inicial:coluna_final,
      remove = F,
      sep = ";"
    )

  return(df_resultados)
}

# Atualiza os resultados (formato Long)
atualizar_base <- function(df_resultados, produto, verbose = FALSE){

  if(is.null(df_resultados)){
    num_concurso <- 1
  } else{
    num_concurso <- max(df_resultados$concurso) + 1
  }

  url_base <- glue::glue(
    "https://servicebus2.caixa.gov.br/portaldeloterias/api/{produto}/"
  )

  resultado_ok <- TRUE

  if(produto == 'timemania'){
    df_final <- data.frame(
      data_apuracao = character(),
      concurso = numeric(),
      houve_ganhador = numeric(),
      valor_premio_maximo = numeric(),
      time = character(),
      numeros_sorteados = numeric(),
      stringsAsFactors = FALSE
    )
  }
  else{
    df_final <- data.frame(
      data_apuracao = character(),
      concurso = numeric(),
      houve_ganhador = numeric(),
      valor_premio_maximo = numeric(),
      numeros_sorteados = numeric(),
      stringsAsFactors = FALSE
    )
  }

  while(resultado_ok){
    resultado_ok = FALSE

    url = paste0(url_base,num_concurso)

    resposta <- httr::GET(url = url, config = httr::config(ssl_verifypeer = F))

    if(resposta$status_code == 200){
      resultado_ok = TRUE
      em_json <- jsonlite::fromJSON(
        httr::content(resposta, "text", encoding = "UTF-8")
      )

      partes_data <- stringr::str_split(em_json$dataApuracao, "/")[[1]]
      data_apuracao <- lubridate::make_date(
        year = partes_data[3],
        month = partes_data[2],
        day = partes_data[1]
      )
      data_apuracao <- lubridate::as_date(data_apuracao)
      rm(partes_data)
      concurso <- as.numeric(em_json$numero)
      houve_ganhador <- ifelse(!em_json$acumulado,1,0)
      valor_premio_maximo <- em_json$listaRateioPremio |>
        dplyr::filter(faixa == 1) |>
        dplyr::select(valorPremio) |> as.numeric()


      if(produto == 'supersete'){
        numeros_sorteados <- as.numeric(em_json$dezenasSorteadasOrdemSorteio)
      }
      else{
        numeros_sorteados <- as.numeric(em_json$listaDezenas)
      }

      if(produto == 'timemania'){
        time <- toupper(
          stringi::stri_trans_general(
            stringr::str_replace(em_json$nomeTimeCoracaoMesSorte, '[ ]*/', '/'),
            'Latin-ASCII'
          )
        )
        tmp_df <- data.frame(data_apuracao, concurso, houve_ganhador,
                             valor_premio_maximo, time, numeros_sorteados)
        df_final <- rbind(df_final, tmp_df)

        rm(tmp_df, data_apuracao, concurso, houve_ganhador,
           valor_premio_maximo, time, numeros_sorteados, em_json)
      }
      else{
        tmp_df <- data.frame(data_apuracao, concurso, houve_ganhador,
                             valor_premio_maximo, numeros_sorteados)
        df_final <- rbind(df_final, tmp_df)

        rm(tmp_df, data_apuracao, concurso, houve_ganhador,
           valor_premio_maximo, numeros_sorteados, em_json)
      }

      if(verbose){
        usethis::ui_info(
          glue::glue(
            'Produto: {produto} | Recebido concurso: {num_concurso}.'
          )
        )
      }

    }
    num_concurso <- num_concurso + 1
  }

  rm(num_concurso, url_base, url, resultado_ok, resposta)

  return(df_final)
}

# Filtrar resultados para uso nas funções do pacote que buscam por resultados
resultados_filtrados <- function(produto,
                                 todos = FALSE,
                                 ultimo = FALSE,
                                 concurso_inicial,
                                 concurso_final) {

  produto <- validar_produto(produto)
  df <- base_produto_escolhido(produto = produto)

  novos_resultados <- atualizar_base(df_resultados = df, produto = produto)

  if(nrow(novos_resultados) > 0 ){
    novos_resultados <- ajustar_base(
      df_resultados = novos_resultados,
      produto = produto
    )

    df <- rbind(df,novos_resultados)
  }

  atual <- max(df$concurso)

  if(todos){
    return(df)
  }
  else if(ultimo){
    df <- df |>
      dplyr::filter(concurso == atual)
    return(df)
  }
  else{
    if(missing(concurso_final) || is.null(concurso_final)){
      concurso_final = atual
    }

    validar_concurso(concurso_inicial)
    validar_concurso(concurso_final)

    df <- dplyr::filter(
      df,
      concurso >= concurso_inicial,
      concurso <= concurso_final
    )

    return(df)
  }
}
