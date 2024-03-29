% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/subset.R
\name{subset_ncol}
\alias{subset_ncol}
\title{Internal utility function.}
\usage{
subset_ncol(x, ncol, random)
}
\arguments{
\item{x}{object to subset}

\item{ncol}{new number of columns}

\item{random}{logical, whether to take a random subset or just the head.}
}
\description{
Utility function. Subset an object \code{x} with columns and 
return another with min(ncol, ncol(x)) columns.
}
\seealso{
\code{\link{help_downsize}}
}
