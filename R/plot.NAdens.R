#' Plot a \code{\link{NAdens}} class object
#' 
#' @description Plot a \code{\link{NAdens}} class object.
#' 
#' @param dens An \code{NAdens} class object.
#' @param NA.label Character label for \code{NA} values on the plot.
#' @param col Fill color.
#' @param border Border color.
#' @param main Plot title.
#' @param xlab X axis label.
#' @param ylab Y axis label.
#' @param bty Type of box to draw around the plot.
#' @param ... Additional arguments to pass to \code{\link[graphics]{plot}}
#' 
#' @examples
#' X <- factor(c(sample(LETTERS[1:5], size = 40, replace = TRUE), rep(NA, 10)))
#' Xdens <- NAdens(X)
#' plot(Xdens)
#' 
#' XX <- c(rnorm(400), rep(NA, 100))
#' XXdens <- NAdens(XX)
#' plot(XXdens)
#' @method plot NAdens
#' @export


plot.NAdens <- function(dens, NA.label = "NA", col = NULL, border = par("fg"), main = NULL, xlab = NULL, ylab = NULL, bty = 'n', ...) {
  if (is.null(col)) col <- "grey"
  if (dens$density.type == "factor") {
    if (is.null(main)) main <- dens$call
    if (is.null(ylab)) ylab <- "Frequency"
    if (is.null(xlab)) xlab <- dens$name
    barplot(
      height = c(dens$y, NA, dens$missing, NA), 
      names.arg = c(dens$x, NA, NA.label, NA), main = main, xlab = xlab, ylab = ylab, 
      col = col, border = border, bty = bty, ...)
    
  }
  if (dens$density.type == "numeric") {
    xrange <- range(dens$x)
    xdiff <- diff(xrange)
    
    missing_width = 0.1 * xdiff
    missing_y <- dens$missing/missing_width
    
    xlim <- xrange[1] + c(0, xdiff * 1.3)
    ylim <- range(c(0, dens$y, missing_y))
    
    if (is.null(main)) main <- dens$call
    if (is.null(ylab)) ylab <- "Density"
    if (is.null(xlab)) xlab <- paste("N =", dens$n * (1 - dens$missing), " Bandwidth = ", round(dens$bw, 4))
    
    plot(xrange[1], 0, type = 'n', main = main, xlim = xlim, ylim = ylim, xlab = "", ylab = ylab, xaxt = 'n', bty = bty, ...)
    mtext(text = xlab, side = 1, line = 3, at = mean(xrange))
    
    mtext(text = paste("N =", dens$n * dens$missing), side = 1, line = 3, at = xrange[2] + 2 * missing_width)
    
    polygon(x = c(dens$x, xrange[2:1]),
            y = c(dens$y, 0, 0),
            col = col,
            border = border)
    xticks <- pretty(xrange)
    xticks <- xticks[which(xticks < xrange[1] + 1.03 * xdiff)]
    xticks <- xticks[which(xticks > par("usr")[1])]
    axis(side = 1, at = xticks)
    
    rect(xleft = xrange[2] + 1.5 * missing_width,
         ybottom = 0,
         xright = xrange[2] + 2.5 * missing_width,
         ytop = missing_y,
         col = col,
         border = border)
    
    axis(side = 1, at = xrange[2] + 2 * missing_width, labels = NA.label, tick = FALSE)
  }
}
