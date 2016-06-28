#' @title Function \code{scale_down}
#' @description Scale down an analysis by calling \code{options(downsize = TRUE)}
#' @export
scale_down = function(){
  options(downsize = TRUE)	
}

#' @title Function \code{scale_up}
#' @description Scale up an analysis by calling \code{options(downsize = FALSE)}
#' @export
scale_up = function(){
  options(downsize = FALSE)	
}

#' @title Function \code{ds}
#' @description Downsize an R object if \code{downsize} is \code{TRUE}.
#' @export
#' @return \code{big} if \code{downsize} is \code{FALSE} and 
#' a downsized object otherwise (either \code{small} if specified or 
#' a select few elements of \code{big}).
#' @param big Object to be downsized if \code{downsize} is \code{TRUE}.
#' @param small Object to return if \code{downsize} is \code{TRUE}. If unspecified,
#' the return object will be computed from \code{big}.
#' @param downsize TRUE/FALSE value, whether to downsize. Defaults to the 
#' global option \code{downsize}, which you can see with \code{getOption("downsize")}
#' and set with \code{options(downsize = TRUE)} or \code{options(downsize = FALSE)}.
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
