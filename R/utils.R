#' @title Internal utility function.
#' @seealso \code{\link{ds}}
#' @param big argument to \code{\link{ds}}
#' @param small argument to \code{\link{ds}}
#' @description Utility function. 
#' Called if "downsize" is TRUE. Compare "small" to "big" and see if
#' the result makes sense.
check_small = function(big, small){
  if(identical(big, small))
    warning("downsizing \"big\" to \"small\", but \"big\" and \"small\" are identical.")
  if(object.size(big) < object.size(small))
    warning("downsizing \"big\" to \"small\", but \"big\" is a smaller object than \"small\".")  
}

#' @title Internal utility function.
#' @seealso \code{\link{ds}}
#' @param arg_name name of an argument to \code{\link{ds}}
#' @description Utility function. Throw an error when downsizing fails.
ds_error = function(arg_name){
  stop(paste0("Could not downsize \"big\" by setting argument \"", arg_name, "\"."))
}

#' @title Internal utility function.
#' @seealso \code{\link{ds}}
#' @param args named list of arguments to \code{\link{ds}}
#' @description Utility function. Inside function ds(), make "small" out of "big" 
#' by subsetting or some other method. This is called if any of 
#' the subsetting arguments to ds() are set (length, dim, etc.)
make_small = function(args){
  stopifnot(is.logical(args$random))
  subset_length(args$big, args$length, args$random) %>%
    subset_dim(args$dim, args$random) %>%
    subset_nrow(args$nrow, args$random) %>%
    subset_ncol(args$ncol, args$random)
}

#' @title Internal utility function.
#' @seealso \code{\link{ds}}
#' @param downsize argument to \code{\link{ds}}
#' @description Utility function. TRUE/FALSE: should the ds() function return 
#' a downsized replacement for "big"?
should_downsize = function(downsize){
  if(is.null(downsize)) downsize = FALSE
  stopifnot(is.logical(downsize))
  downsize
}

#' @title Internal utility function.
#' @seealso \code{\link{ds}}
#' @param args named list of arguments to \code{\link{ds}}
#' @description Utility function. Should "small" be made from "big"? 
#' Returns \code{TRUE} if at least one of the subsetting arguments
#' (length, dim, etc.) or similar is set.
should_make_small = function(args){
  subsetters = args[setdiff(names(args), c("big", "small", "downsize", "random"))]
  !all(sapply(subsetters, is.null))
}
