% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/NAdens.integer.R
\name{NAdens.integer}
\alias{NAdens.integer}
\title{Construct a \code{\link{NAdens}} class object from a integer vector}
\usage{
\method{NAdens}{integer}(x, nogaps = TRUE)
}
\arguments{
\item{x}{an integer vector.}

\item{nogaps}{logical. If true, frequencies for all integers within the range of \code{x} are included.}
}
\description{
Construct a \code{\link{NAdens}} class object from a integer vector
}
\examples{
X <- c(sample.int(5, size = 40, replace = TRUE), rep(NA, 10))
Xdens <- NAdens(X)
plot(Xdens)
}

