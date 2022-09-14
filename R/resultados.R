#' Resultados de Todos os Concursos
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
#' __Importante__: o pacote atualiza as bases diariamente no repositório do GitHub,
#' porém, sua base local permanece com os dados do momento em que o pacote foi
#' instalado. Caso tenha intenção de usar as bases diretamente, sem chamar as
#' funções, reinstale o pacote para obter as bases mais recentes.
#'
#' @return Uma \code{tibble} - a quantidade de variáveis depende do produto.
#' @export
#'
#' @examples
#' # Visualizar concurso, números sorteados e se houve ganhador referente aos
#' # resultados de todos os concursos da Megasena
#' resultado_todos(produto = 'megasena') |>
#'    dplyr::select(concurso, numeros_sorteados, houve_ganhador)
resultado_todos <- function(produto = 'megasena'){

  resultados <- resultados_filtrados(
    produto = produto,
    todos=TRUE
  )

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
#' __Importante__: o pacote atualiza as bases diariamente no repositório do GitHub,
#' porém, sua base local permanece com os dados do momento em que o pacote foi
#' instalado. Caso tenha intenção de usar as bases diretamente, sem chamar as
#' funções, reinstale o pacote para obter as bases mais recentes.
#'
#' @return Uma \code{tibble} - a quantidade de variáveis depende do produto.
#' @export
#'
#' @examples
#' # Visualizar concurso, números sorteados e se houve ganhador referente ao
#' # resultado do concurso 1000 da Megasena
#' resultado_concurso(produto = 'megasena', num_concurso = 1000) |>
#'    dplyr::select(concurso, numeros_sorteados, houve_ganhador)
resultado_concurso <- function(produto = 'megasena', num_concurso){

  resultados <- resultados_filtrados(
    produto = produto,
    concurso_inicial = num_concurso,
    concurso_final = num_concurso
  )

  return(resultados)
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
#' __Importante__: o pacote atualiza as bases diariamente no repositório do GitHub,
#' porém, sua base local permanece com os dados do momento em que o pacote foi
#' instalado. Caso tenha intenção de usar as bases diretamente, sem chamar as
#' funções, reinstale o pacote para obter as bases mais recentes.
#'
#' @return Uma \code{tibble} - a quantidade de variáveis depende do produto.
#' @export
#'
#' @examples
#' # Visualizar concurso, números sorteados e se houve ganhador referentes aos
#' # resultados dos concursos entre 1000 a 1500 da Megasena
#' resultado_concursos(
#'    produto = 'megasena',
#'    num_concurso_inicial = 1000,
#'    num_concurso_final = 1500
#'  ) |> dplyr::select(concurso, numeros_sorteados, houve_ganhador)
resultado_concursos <- function(produto = 'megasena', num_concurso_inicial, num_concurso_final){

  resultados <- resultados_filtrados(
    produto = produto,
    concurso_inicial = num_concurso_inicial,
    concurso_final  = num_concurso_final
  )

  return(resultados)
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
#' __Importante__: o pacote atualiza as bases diariamente no repositório do GitHub,
#' porém, sua base local permanece com os dados do momento em que o pacote foi
#' instalado. Caso tenha intenção de usar as bases diretamente, sem chamar as
#' funções, reinstale o pacote para obter as bases mais recentes.
#'
#' @return Uma \code{tibble} - a quantidade de variáveis depende do produto.
#' @export
#'
#' @examples
#' # Visualizar concurso, números sorteados e se houve ganhador referente ao
#' # resultado do concurso mais recente da Megasena
#' resultado_ultimo_concurso(produto = 'megasena') |>
#'    dplyr::select(concurso, numeros_sorteados, houve_ganhador)
resultado_ultimo_concurso <- function(produto = 'megasena'){

  resultados <- resultados_filtrados(
    produto = produto,
    ultimo=TRUE
  )

  return(resultados)
}
