#' Todos os Resultados
#'
#' @details
#' Utilize esta função para receber um conjunto de dados contendo todos os
#' resultados do produto escolhido.
#' __Importante__: o pacote atualiza as bases diariamente, porém, após instalá-lo
#' é importante que faça a atualização manual quando desejar os resultados mais
#' recentes. Utilize a função [atualizar_base_resultados] para este fim.
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
#'
#' @examples
#' # Receber os resultados de todos os concursos da Megasena
#' # No caso da Megasena, o resultado será uma tibble com 8 variáveis
#' resultados_todos(produto = 'megasena')
resultados_todos <- function(produto = 'megasena'){

  resultados <- base_produto_escolhido(produto)

  return(resultados)
}

#' Resultado de um Concurso Específico
#'
#' @details
#' Utilize esta função para receber um conjunto de dados contendo o resultado
#' de um concurso específico.
#' __Importante__: o pacote atualiza as bases diariamente, porém, após instalá-lo
#' é importante que faça a atualização manual quando desejar os resultados mais
#' recentes. Utilize a função [atualizar_base_resultados] para este fim.
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
#' @param concurso Número do concurso que deseja obter o resultado.
#'
#' @return Uma \code{tibble} - a quantidade de variáveis depende do produto.
#' @export
#'
#' @examples
#' # Receber os resultados do concurso número 1000 da Megasena
#' # No caso da Megasena, o resultado será uma tibble com 8 variáveis
#' resultado_concurso(produto = 'megasena', concurso = 1000)
resultado_concurso <- function(produto = 'megasena', concurso){
  if(is.null(concurso)){
    usethis::ui_stop('Nao foi informado um concurso.
                     Para esta funcao, informe um concurso.')
  }

  if(!is.numeric(concurso)){
    usethis::ui_stop('Valor de concurso invalido.
                     Concurso deve ser um valor numerico.')
  }

  resultados <- base_produto_escolhido(produto)

  df <- resultados_filtrados(
    df_resultados = resultados,
    concurso_inicial = concurso,
    concurso_final = concurso
  )

  return(df)
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

resultados_filtrados <- function(df_resultados, concurso_inicial = 1, concurso_final = NULL){
  if(is.null(concurso_final)){
    df <- dplyr::filter(
      df_resultados,
      num_concurso >= concurso_inicial
    )
    return(df)
  }else{
    df <- dplyr::filter(
      df_resultados,
      num_concurso >= concurso_inicial,
      num_concurso <= concurso_final
    )
    return(df)
  }
}
