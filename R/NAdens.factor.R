#' Construct a \code{\link{NAdens}} class object from a factor vector
#' 
#' @param x a factor vector.
#' @examples
#' X <- factor(c(sample(LETTERS[1:5], size = 40, replace = TRUE), rep(NA, 10)))
#' Xdens <- NAdens(X)
#' plot(Xdens)
#' @method NAdens factor
#' @export

NAdens.factor <- function(x) {
  name <- deparse(substitute(x))
  x <- addNA(x)
  pt <- prop.table(table(x))
  pt <- setNames(as.numeric(pt), names(pt))
  na_index <- which(is.na(names(pt)))
  structure(
    list(
      x = names(pt)[-na_index],
      y = pt[-na_index],
      missing = pt[na_index],
      bw = NULL,
      n = length(x),
      call = match.call(),
      data.name = name,
      density.type = "factor"),
    class = "NAdens")
}

