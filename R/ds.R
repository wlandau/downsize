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
ds = function(big, small = NULL, 
  downsize = getOption("downsize"), 
  length = NULL,
  dim = NULL,
  nrow = NULL,
  ncol = NULL){
  if(is.null(small)){
    small = big
    if(is.vector(small)){
      n = min(length(small), length)
      small = small[1:n]
    } 
    if(!is.null(dim(small))){
      if(is.null(dim)) dim = dim(small)
      if(!is.null(nrow)) dim[1] = min(dim(small)[1], nrow)
      if(!is.null(ncol)) dim[2] = min(dim(small)[2], ncol)
      dim = pmin(dim(small), dim)
      indices = lapply(dim, function(i) 1:i)
      small = extract.array(small, indices = indices)
    } 
  }
  if(downsize) return(small)
  big
}
