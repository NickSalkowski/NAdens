#' Construct a \code{\link{NAdens}} class object from a logical vector
#' 
#' @param x a logical vector.
#' @examples
#' X <- c(sample(c(TRUE, FALSE), size = 40, replace = TRUE), rep(NA, 10))
#' Xdens <- NAdens(X)
#' plot(Xdens)
#' @method NAdens logical
#' @export

NAdens.logical <- function(x) {
  NAdens(factor(x))
}