missing_small = function(){
  "..missing_small.."
}

#' @title Utility function
#' @description Utility function
#' @export
#' @seealso ds
#' @return utility object
#' @param big utility parameter
#' @param dim utility parameter
#' @param random utility parameter
ds_array = function(big, dim = NULL, random = FALSE){
  if(is.null(dim)) return(big)
  if(length(dim) != length(dim(big))) stop("incorrect length for dim.")
  indices = lapply(1:length(dim(big)), function(i) 
    get_indices(max_length = dim(big)[i], length = dim[i], random = random))
  extract.array(big, indices = indices)
}

#' @title Utility function
#' @description Utility function
#' @export
#' @seealso ds
#' @return utility object
#' @param big utility parameter
#' @param length utility parameter
#' @param random utility parameter
ds_vector = function(big, length = NULL, random = FALSE){
  ns = get_indices(max_length = length(big), length = length, random = random)
  big[ns]
}

#' @title Utility function
#' @description Utility function
#' @export
#' @seealso ds
#' @return utility object
#' @param big utility parameter
#' @param dim utility parameter
#' @param length utility parameter
#' @param nrow utility parameter
#' @param ncol utility parameter
fix_dim = function(big, dim = NULL, length = NULL, nrow = NULL, ncol = NULL){
  if(is.vector(big)){
    if(is.null(length)) length = length(big)
    if(!is.null(dim)) length = min(length, dim[1])
    return(min(length(big), length))
  }
  if(length(dim(big)) < 2) return()
  if(is.null(dim)) dim = dim(big)
  if(!is.null(nrow)) dim[1] = min(dim(big)[1], nrow)
  if(!is.null(ncol)) dim[2] = min(dim(big)[2], ncol)
  pmin(dim(big), dim)
}

#' @title Utility function
#' @description Utility function
#' @export
#' @seealso ds
#' @return utility object
#' @param max_length utility parameter
#' @param length utility parameter
#' @param random utility parameter
get_indices = function(max_length, length, random = FALSE){
  n = min(max_length, length)
  if(n == max_length) return(1:max_length)
  ns = 1:n
  if(random) ns = sample.int(max_length, n)
  ns
}
