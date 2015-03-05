#' Construct a \code{\link{NAdens}} class object from a character vector
#' 
#' @param x a character vector.
#' @examples
#' X <- c(sample(LETTERS[1:5], size = 40, replace = TRUE), rep(NA, 10))
#' Xdens <- NAdens(X)
#' plot(Xdens)
#' @method NAdens character
#' @export

NAdens.character <- function(x) {
  NAdens(factor(x))
}