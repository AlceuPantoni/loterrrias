#' Lista Produtos Disponíveis
#'
#' @description
#' Utilize esta função para receber um conjunto de dados contendo todos os
#' produtos disponíveis.
#'
#' @details
#' Dataset retornado contém as seguintes variáveis:
#' * __nome_produto__ Nome oficial do produto (character)
#' * __parametro_produto__ String a ser utilizada como parâmetro ao executar as
#' funções do pacote (character)
#' * __qtde_numeros_sorteio__ Quantidade de números sorteados (numeric)
#'
#' @return Uma \code{tibble} com três variáveis.
#' @export
#'
#' @examples
#' # Retorna uma tibble contendo os produtos disponíveis
#' produtos_existentes()
produtos_existentes <- function(){
  retorno <- data.frame(
    nome_produto = c("Mega-sena", "Lotof\u00E1cil", "Quina", "Lotomania", "Timemania", "Super Sete", "Dia de Sorte"),
    parametro_produto = c("megasena", "lotofacil", "quina", "lotomania", "timemania", "supersete", "diadesorte"),
    qtde_numeros_sorteio = c(6,15,5,20,7,7,7)
  ) |> tibble::tibble()

  return(retorno)
}
