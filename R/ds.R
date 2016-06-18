#' @title Function \code{ds}
#' @description Conditionally downsize an R object
#' @export
#' @return \code{big} if \code{downsize} is \code{TRUE} and \code{small} otherwise.
#' @param big Big version of the object.
#' @param small Small version of the object for a downsized analysis
#' @param downsize TRUE/FALSE value, whether to downsize.
#' @param length Length to downsize vectors to.
#' @param dim Dimension to downsize arrays and matrices to.
#' @param nrow Downsized number of rows. Overrides \code{dim}.
#' @param ncol Downsized number of columns. Overrides \code{dim}.
#' @param random If TRUE, take a random subset of \code{big} instead
#' of the first few elements, rows, columns, etc.
ds = function(big, small = NULL, downsize = getOption("downsize"), 
  length = NULL, dim = NULL, nrow = NULL, ncol = NULL, random = FALSE){
  out = big
  if(!downsize) return(out)
  if(!is.null(small) & downsize) return(small)
  if(!is.atomic(out)) return(out)
  dim = fix_dim(big = out, dim = dim, length = length, nrow = nrow, ncol = ncol)
  if(is.vector(out)) out = ds_vector(big = out, length = dim[1], random = random)
  if(length(dim(out)) > 1) out = ds_array(big = out, dim = dim, random = random) 
  out
}
