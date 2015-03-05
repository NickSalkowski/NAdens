#' Construct a \code{\link{NAdens}} class object from a numeric vector
#' 
#' @param x a character vector.
#' @param ... Additional arguments passed to \code{\link[stats]{density}}.
#' @examples
#' X <- c(rnorm(40), rep(NA, 10))
#' Xdens <- NAdens(X)
#' plot(Xdens)
#' @method NAdens numeric
#' @export

NAdens.numeric <- function(x, ...) {
  name <- deparse(substitute(x))
  missing <- mean(is.na(x))
  dens <- density(x, na.rm = TRUE, ...)
  structure(
    list(
      x = dens$x,
      y = dens$y * (1 - missing),
      missing = missing,
      bw = dens$bw,
      n = length(x),
      call = match.call(),
      data.name = name,
      density.type = "numeric"),
    class = "NAdens")
}
