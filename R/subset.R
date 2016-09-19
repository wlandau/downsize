#' @title Internal utility function.
#' @seealso \code{\link{downsize}}
#' @param x object to subset
#' @param dim new dimensions
#' @param random logical, whether to take a random subset or just the head.
#' @description Utility function. Subset an object \code{x} with a 
#' \code{dim} attribute (matrix/array/data.frame/etc.)
#' and return another with dimensions pmin(dim, dim(x))
subset_dim = function(x, dim, random){
  if(is.null(dim)) return(x)
  stopifnot(all(dim > 0))
  tryCatch({
    for(i in 1:length(dim)) x = subset_single_dim(x, i, dim[i], random)
    x
  }, error = function(e) downsize_error("dim"))
}

#' @title Internal utility function.
#' @seealso \code{\link{downsize}}
#' @param x object to subset
#' @param length new length
#' @param random logical, whether to take a random subset or just the head.
#' @description Utility function. Subset a vector/list/etc. 
#' \code{x} and return another with length min(length, length(x))
subset_length = function(x, length, random){
  if(is.null(length)) return(x)
  stopifnot(length > 0)
  tryCatch({
    if(random) x = sample(x, replace = FALSE)
    x[1:min(length, length(x))]
  }, error = function(e) downsize_error("length"))
}

#' @title Internal utility function.
#' @seealso \code{\link{downsize}}
#' @param x object to subset
#' @param ncol new number of columns
#' @param random logical, whether to take a random subset or just the head.
#' @description Utility function. Subset an object \code{x} with columns and 
#' return another with min(ncol, ncol(x)) columns.
subset_ncol = function(x, ncol, random){
  if(is.null(ncol)) return(x)
  stopifnot(ncol > 0)
  tryCatch({
    subset_single_dim(x, 2, ncol, random)
  }, error = function(e) downsize_error("ncol"))
}


#' @title Internal utility function.
#' @seealso \code{\link{downsize}}
#' @param x object to subset
#' @param nrow new number of rows
#' @param random logical, whether to take a random subset or just the head.
#' @description Utility function. Subset an object \code{x} with rows and 
#' return another with min(nrow, nrow(x)) columns.
subset_nrow = function(x, nrow, random){
  if(is.null(nrow)) return(x)
  stopifnot(nrow > 0)
  tryCatch({
    subset_single_dim(x, 1, nrow, random)
  }, error = function(e) downsize_error("nrow"))
}

#' @title Internal utility function.
#' @seealso \code{\link{downsize}}
#' @param x object to subset
#' @param which_dim index of dimension along which to subset
#' @param dim_length new length/size of the dimension of \code{x} with index \code{which_dim}
#' @param random logical, whether to take a random subset or just the head.
#' @description Utility function. Same as \link{subset_dim}, but along the 
#' single dimension with index \code{which_dim}.
subset_single_dim = function(x, which_dim, dim_length, random){
  if(is.null(which_dim) || is.null(dim_length)) return(x)
  stopifnot(which_dim > 0 & dim_length > 0)
  n = dim(x)[which_dim]
  dim_length = min(n, dim_length)
  i = 1:dim_length
  if(random) i = sample.int(n, size = dim_length, replace = FALSE)
  extract.array(x, indices = list(i), dims = which_dim)
}
