#' @title Function \code{ds}. Deprecated.
#' @description Deprecated. Use function \code{\link{downsize}} instead.
#' @seealso \code{\link{downsize}}
#' @export
#' @return A downsized object if \code{downsize} is \code{TRUE} and \code{big} otherwise.
#' @param big Object to return if \code{downsize} is \code{FALSE} or \code{NULL}.
#' @param small Object to return if \code{downsize} is \code{TRUE} and all subsetter 
#' arguments such as \code{length} and \code{dim} are \code{NULL}.
#' @param downsize \code{TRUE}/\code{FALSE} value (\code{NULL} counts as \code{FALSE}), 
#' whether to replace \code{big} with a downsized object.
#' Defaults to the global option \code{downsize}, which you can check with
#' \code{getOption("downsize")} or the \code{\link{scaling}} function and set with functions
#' \code{\link{downsize}}, \code{\link{scale_down}} or \code{\link{scale_up}}.
#' @param random If \code{TRUE}, take a random subset of \code{big} instead
#' of the first few elements. For example, if \code{nrow == 3}, take a random 
#' 3 rows instead of the first 3.
#' @param warn \code{TRUE/FALSE} option to warn the user if \code{big} and \code{small}
#' are identical or \code{big} is smaller in memory than \code{small}.
#' @param length Downsize \code{big} to this length if \code{downsize} is \code{TRUE}.
#' @param dim Downsize \code{big} to these dimensions if \code{downsize} is \code{TRUE}.
#' @param ncol Downsize \code{big} to this number of columns if \code{downsize} is \code{TRUE}.
#' @param nrow Downsize \code{big} to this number of rows if \code{downsize} is \code{TRUE}.
ds = function(big, small = NULL, downsize = getOption("downsize"), warn = TRUE,
  random = FALSE, length = NULL, dim = NULL, ncol = NULL, nrow = NULL){
  .Deprecated("downsize", package="downsize")
  downsize(big = big, small = small, downsize = downsize, warn = warn,
    random = random, length = length, dim = dim, ncol = ncol, nrow = nrow)
}