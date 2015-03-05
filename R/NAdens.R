#' Construct a \code{NAdens} class object
#' 
#' @param x A vector of data.
#' @param ... Additional arguments passed to \code{\link{NAdens.integer}} or \code{\link[stats]{density}}.
#' @details A method is dispatched depending on the class of \code{x}.  
#' If \code{x} is numeric, then \code{\link[stats]{density}} is used to 
#' estimate the density.  Otherwise, \code{x} is converted to a 
#' \code{\link[base]{factor}}, and the frequencies are calculated.
#'  
#' @return A \code{NAdens} class object, which is a list containing the following
#' components.
#' 
#' \describe{
#'   \item{x}{The factor levels or coordinates where the density is estimated.}
#'   \item{y}{The estimated frequencies or density values, adjusted for the frequency of \code{NA}.}
#'   \item{missing}{The frequency of \code{NA}.}
#'   \item{bw}{NULL or the bandwidth used for the density estimate.}
#'   \item{n}{The length of \code{x}.}
#'   \item{call}{The call which produced the result.}
#'   \item{data.name}{The deparsed name of the \code{x} argument.}
#'   \item{density.type}{Either `factor` for frequency or `numeric` for density.}
#' }
#' @export

NAdens <- function(x, ...) UseMethod("NAdens")

