% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/subset.R
\name{subset_single_dim}
\alias{subset_single_dim}
\title{Internal utility function.}
\usage{
subset_single_dim(x, which_dim, dim_length, random)
}
\arguments{
\item{x}{object to subset}

\item{which_dim}{index of dimension along which to subset}

\item{dim_length}{new length/size of the dimension of \code{x} with index \code{which_dim}}

\item{random}{logical, whether to take a random subset or just the head.}
}
\description{
Utility function. Same as \link{subset_dim}, but along the 
single dimension with index \code{which_dim}.
}
\seealso{
\code{\link{help_downsize}}
}
