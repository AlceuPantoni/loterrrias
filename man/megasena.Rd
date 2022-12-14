% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{megasena}
\alias{megasena}
\title{Megasena}
\format{
Uma tibble contendo 8 variávies.
\itemize{
\item \strong{data_apuracao} Data do sorteio (date)
\item \strong{concurso} Numero do concurso (numeric)
\item \strong{houve_ganhador} Flag indicando se houve ganhador do prêmio máximo no
concurso  <0 ou 1> (numeric)
\item \strong{valor_premio_maximo} Valor total do prêmio máximo do concurso, caso
exista ganhador (numeric)
\item \strong{numeros_sorteados} Todos os números sorteados, separados por ponto
e vírgula (character)
\item \strong{num_1} Primeira dezena do sorteio (numeric)
\item \strong{num_2} Segunda dezena do sorteio (numeric)
\item \strong{num_3} Terceira dezena do sorteio (numeric)
\item \strong{num_4} Quarta dezena do sorteio (numeric)
\item \strong{num_5} Quinta dezena do sorteio (numeric)
\item \strong{num_6} Sexta dezena do sorteio (numeric)
}
}
\source{
Site da Loteria Federal \url{https://loterias.caixa.gov.br/Paginas/Mega-Sena.aspx}
}
\usage{
megasena
}
\description{
Conjunto de dados contendo todos os resultados do produto das Loterias
chamado Megasena.
}
\note{
Números em ordem crescente e não na ordem em que foram sorteados.
}
\keyword{datasets}
