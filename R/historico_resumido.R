#' Resumo Histórico de Todos os Produtos
#'
#' @description
#' Utilize esta função para obter um resumo histórico de todos os produtos
#' das Loterias do Brasil.
#'
#' @details
#' Dados presentes no resumo:
#' * __nome_produto__ (character)
#' * __data_primeiro_concurso__ (date)
#' * __quantidade_concursos__ (numeric)
#' * __quantidade_concursos_com_ganhador__ (numeric)
#' * __percentual_com_ganhador__ (numeric)
#' * __media_premiacao__ (numeric)
#' * __maior_premio__ (numeric)
#' * __menor_premio__ (numeric)
#' * __total_dezenas_sorteadas__ (numeric)
#' * __numero_mais_sorteado__ (numeric)
#' * __numero_menos_sorteado__ (numeric)
#'
#' @return Uma \code{tibble} contendo sete variáveis.
#' @export
#'
#' @examples
#' # Gerando o resumo e filtrando o nome do produto, a quatidade de concursos
#' # e o percentual do concursos em que houve ganhador
#' historico_resumido_produtos() |>
#'  dplyr::select(nome_produto, quantidade_concursos, percentual_com_ganhador)
#'
historico_resumido_produtos <- function(){

  df_final <- tibble::tibble(
    nome_produto = character(),
    data_primeiro_concurso = date(),
    quantidade_concursos = numeric(),
    quantidade_concursos_com_ganhador = numeric(),
    percentual_com_ganhador = numeric(),
    media_premiacao = numeric(),
    maior_premio = numeric(),
    menor_premio = numeric(),
    total_dezenas_sorteadas = numeric(),
    numero_mais_sorteado = numeric(),
    numero_menos_sorteado = numeric()
  )

  produtos <- produtos_existentes()

  for(prod in produtos$parametro_produto){

    nome_produto <- produtos |>
      dplyr::filter(parametro_produto == prod) |>
      dplyr::select(nome_produto) |>
      as.character()

    df_resultados <- base_produto_escolhido(produto = prod)

    quantidade_concursos <- max(df_resultados$concurso)

    quantidade_concursos_com_ganhador <- sum(df_resultados$houve_ganhador)

    percentual_com_ganhador <- round(
      quantidade_concursos_com_ganhador / quantidade_concursos,
      2
    )

    maior_premio <- max(df_resultados$valor_premio_maximo)

    menor_premio <- min(
      df_resultados[df_resultados$houve_ganhador != 0,]$valor_premio_maximo
    )

    media_premiacao <- round(
      mean(
        df_resultados[df_resultados$houve_ganhador != 0,]$valor_premio_maximo
      ),
      2
    )

    data_primeiro_concurso <- min(df_resultados$data_apuracao)

    numeros_historico <- df_resultados |>
      dplyr::select(numeros_sorteados) |>
      as.vector() |>
      unlist() |>
      stringr::str_split(pattern = ";") |>
      unlist() |>
      as.numeric()

    dezenas_sorteadas <- length(numeros_historico)

    numeros_historico <- data.frame(numeros = numeros_historico) |>
      dplyr::mutate(contador = 1) |>
      dplyr::group_by(numeros) |>
      dplyr::summarise(quantidade = sum(contador)) |>
      dplyr::arrange(dplyr::desc(quantidade))

    qtde_numeros <- nrow(numeros_historico)

    numero_mais_sorteado <- as.numeric(numeros_historico[1,1])
    numero_menos_sorteado <- as.numeric(numeros_historico[qtde_numeros,1])

    rm(df_resultados, numeros_historico, qtde_numeros)

    df_temp <- tibble::tibble(
      nome_produto = nome_produto,
      data_primeiro_concurso = data_primeiro_concurso,
      quantidade_concursos = quantidade_concursos,
      quantidade_concursos_com_ganhador = quantidade_concursos_com_ganhador,
      percentual_com_ganhador = percentual_com_ganhador,
      media_premiacao = media_premiacao,
      maior_premio = maior_premio,
      menor_premio = menor_premio,
      total_dezenas_sorteadas = dezenas_sorteadas,
      numero_mais_sorteado = numero_mais_sorteado,
      numero_menos_sorteado = numero_menos_sorteado
    )

    df_final <- rbind(df_final,df_temp)

    rm(df_temp, nome_produto, data_primeiro_concurso, dezenas_sorteadas, maior_premio,
       menor_premio, media_premiacao, numero_mais_sorteado, numero_menos_sorteado,
       percentual_com_ganhador, prod, quantidade_concursos,
       quantidade_concursos_com_ganhador)

  }

  rm(produtos)

  return(df_final)
}
