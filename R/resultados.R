#' Todos os Resultados
#'
#' @description
#' Utilize esta função para receber um conjunto de dados contendo todos os
#' resultados do produto escolhido.
#'
#' @param produto Nome do jogo das Loterias que deseja atualizar a base. Caso não
#' informado, por padrão será a Megasena [megasena].
#' Produtos disponíveis:
#' * Megasena -> digite 'megasena' [megasena]
#' * Lotofácil -> digite 'lotofacil' [lotofacil]
#' * Quina -> digite 'quina' [quina]
#' * Lotomania -> digite 'lotomania' [lotomania]
#' * Timemania -> digite 'timemania' [timemania]
#' * Super Sete -> digite 'supersete' [supersete]
#' * Dia de Sorte -> digite 'diadesorte' [diadesorte]
#'
#' @details
#' __Importante__: o pacote atualiza as bases diariamente, porém, após instalá-lo
#' é importante que faça a atualização manual quando desejar os resultados mais
#' recentes. Utilize a função [atualizar_base_resultados] para este fim.
#'
#' @return Uma \code{tibble} - a quantidade de variáveis depende do produto.
#' @export
#'
#' @examples
#' # Visualizar a data, concurso e números sorteados referente aos resultados
#' # de todos os concursos da Megasena
#' # No caso da Megasena, o resultado será uma tibble com 8 variáveis
#' resultados_todos(produto = 'megasena') |>
#'    dplyr::select(data_apuracao, concurso, numeros_sorteados)
resultados_todos <- function(produto = 'megasena'){

  resultados <- base_produto_escolhido(produto)

  return(resultados)
}

#' Resultado de um Concurso Específico
#'
#' @description
#' Utilize esta função para receber um conjunto de dados contendo o resultado
#' de um concurso específico.
#'
#' @param produto Nome do jogo das Loterias que deseja atualizar a base. Caso não
#' informado, por padrão será a Megasena [megasena].
#' Produtos disponíveis:
#' * Megasena -> digite 'megasena' [megasena]
#' * Lotofácil -> digite 'lotofacil' [lotofacil]
#' * Quina -> digite 'quina' [quina]
#' * Lotomania -> digite 'lotomania' [lotomania]
#' * Timemania -> digite 'timemania' [timemania]
#' * Super Sete -> digite 'supersete' [supersete]
#' * Dia de Sorte -> digite 'diadesorte' [diadesorte]
#' @param num_concurso Número do concurso que deseja obter o resultado.
#'
#' @details
#' __Importante__: o pacote atualiza as bases diariamente, porém, após instalá-lo
#' é importante que faça a atualização manual quando desejar os resultados mais
#' recentes. Utilize a função [atualizar_base_resultados] para este fim.
#'
#' @return Uma \code{tibble} - a quantidade de variáveis depende do produto.
#' @export
#'
#' @examples
#' # Visualizar a data, concurso e números sorteados referente ao resultado do
#' # concurso 1000 da Megasena
#' # No caso da Megasena, o resultado será uma tibble com 8 variáveis
#' resultado_concurso(produto = 'megasena', num_concurso = 1000) |>
#'    dplyr::select(data_apuracao, concurso, numeros_sorteados)
resultado_concurso <- function(produto = 'megasena', num_concurso){
  if(is.null(num_concurso)){
    usethis::ui_stop('Nao foi informado um concurso.
                     Para esta funcao, informe um concurso.')
  }

  if(!is.numeric(num_concurso)){
    usethis::ui_stop('Valor de concurso invalido.
                     Concurso deve ser um valor numerico.')
  }

  resultados <- base_produto_escolhido(produto)

  df <- resultados_filtrados(
    df_resultados = resultados,
    concurso_inicial = num_concurso,
    concurso_final = num_concurso
  )

  return(df)
}

#' Resultado de um Range de Concursos
#'
#' @description
#' Utilize esta função para receber um conjunto de dados contendo os resultados
#' de um range de concursos, especificando o inicial e o final.
#'
#' @param produto Nome do jogo das Loterias que deseja atualizar a base. Caso não
#' informado, por padrão será a Megasena [megasena].
#' Produtos disponíveis:
#' * Megasena -> digite 'megasena' [megasena]
#' * Lotofácil -> digite 'lotofacil' [lotofacil]
#' * Quina -> digite 'quina' [quina]
#' * Lotomania -> digite 'lotomania' [lotomania]
#' * Timemania -> digite 'timemania' [timemania]
#' * Super Sete -> digite 'supersete' [supersete]
#' * Dia de Sorte -> digite 'diadesorte' [diadesorte]
#' @param num_concurso_inicial Número do concurso inicial que deseja obter o resultado.
#' @param num_concurso_final Número do concurso final que deseja obter o resultado.
#' Este não é um parâmetro obrigatório. Caso informar apenas o concurso inicial,
#' serão retornados os dados desde o concurso inicial informado até o concurso mais
#' recente que existir no dataset.
#'
#' @details
#' __Importante__: o pacote atualiza as bases diariamente, porém, após instalá-lo
#' é importante que faça a atualização manual quando desejar os resultados mais
#' recentes. Utilize a função [atualizar_base_resultados] para este fim.
#'
#' @return Uma \code{tibble} - a quantidade de variáveis depende do produto.
#' @export
#'
#' @examples
#' # Visualizar a data, concurso e números sorteados referentes aos resultados
#' # dos concursos entre 1000 a 1500 da Megasena
#' # No caso da Megasena, o resultado será uma tibble com 8 variáveis
#' resultado_range_concursos(
#'    produto = 'megasena',
#'    num_concurso_inicial = 1000,
#'    num_concurso_final = 1500
#'  ) |> dplyr::select(data_apuracao, concurso, numeros_sorteados)
resultado_range_concursos <- function(produto = 'megasena', num_concurso_inicial, num_concurso_final){
  if(is.null(num_concurso_inicial)){
    usethis::ui_stop('Nao foi informado o concurso inicial.
                     Para esta funcao, deve-se informar ao menos o concurso inicial.')
  }

  if(!(is.numeric(num_concurso_inicial) | is.numeric(num_concurso_final))){
    usethis::ui_stop('Valor de concurso invalido.
                     Concurso deve ser um valor numerico.')
  }

  resultados <- base_produto_escolhido(produto)

  df <- resultados_filtrados(
    df_resultados = resultados,
    concurso_inicial = num_concurso_inicial,
    concurso_final = num_concurso_final
  )

  return(df)
}

#' Resultado do Último Concurso
#'
#' @description
#' Utilize esta função para receber um conjunto de dados contendo todos o
#' resultado do último concurso do produto escolhido.
#'
#' @param produto Nome do jogo das Loterias que deseja atualizar a base. Caso não
#' informado, por padrão será a Megasena [megasena].
#' Produtos disponíveis:
#' * Megasena -> digite 'megasena' [megasena]
#' * Lotofácil -> digite 'lotofacil' [lotofacil]
#' * Quina -> digite 'quina' [quina]
#' * Lotomania -> digite 'lotomania' [lotomania]
#' * Timemania -> digite 'timemania' [timemania]
#' * Super Sete -> digite 'supersete' [supersete]
#' * Dia de Sorte -> digite 'diadesorte' [diadesorte]
#'
#' @details
#' __Importante__: o pacote atualiza as bases diariamente, porém, após instalá-lo
#' é importante que faça a atualização manual quando desejar os resultados mais
#' recentes. Utilize a função [atualizar_base_resultados] para este fim.
#' No caso desta função, essa rotina citada de atualização de base é acionada
#' automaticamente para o produto especificado.
#'
#' @return Uma \code{tibble} - a quantidade de variáveis depende do produto.
#' @export
#'
#' @examples
#' # Visualizar a data, concurso e números sorteados referente ao resultado do
#' # concurso mais recente da Megasena
#' # No caso da Megasena, o resultado será uma tibble com 8 variáveis
#' resultados_ultimo_concurso(produto = 'megasena') |>
#'    dplyr::select(data_apuracao, concurso, numeros_sorteados)
resultados_ultimo_concurso <- function(produto = 'megasena'){

  resultados <- atualizar_base_resultados(produto = produto)

  ultimo_concurso <- max(resultados$concurso)

  resultados <- resultados |>
    dplyr::filter(concurso == ultimo_concurso)

  return(resultados)
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
      concurso >= concurso_inicial
    )
    return(df)
  }else{
    df <- dplyr::filter(
      df_resultados,
      concurso >= concurso_inicial,
      concurso <= concurso_final
    )
    return(df)
  }
}
