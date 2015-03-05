#' Construct a \code{\link{NAdens}} class object from a integer vector
#' 
#' @param x an integer vector.
#' @param nogaps logical. If true, frequencies for all integers within the range of \code{x} are included.
#' @examples
#' X <- c(sample.int(5, size = 40, replace = TRUE), rep(NA, 10))
#' Xdens <- NAdens(X)
#' plot(Xdens)
#' @method NAdens integer
#' @export

NAdens.integer <- function(x, nogaps = TRUE) {
  x <- if (nogaps) {
    factor(x, levels = seq(min(x, na.rm = TRUE), max(x, na.rm = TRUE)))
  } else {
    factor(x)
  }
  NAdens(x)
}
