#' @title Internal utility function.
#' @seealso \code{\link{downsize}}
#' @param args named list of arguments to \code{\link{downsize}}
#' @description Utility function. Checks that arguments are valid.
check_args = function(args){
  if(use_arg_small(args) & is.null(args$small))
    stop("not enough information to downsize.")
  if(!use_arg_small(args) & !is.null(args$small))
    stop("conflicts in arguments: \"small\" cannot be set at the same time as arguments that subset \"big\" (such as \"length\").")
}

#' @title Internal utility function.
#' @seealso \code{\link{downsize}}
#' @param big argument to \code{\link{downsize}}
#' @param small argument to \code{\link{downsize}}
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
#' @seealso \code{\link{downsize}}
#' @param arg_name name of an argument to \code{\link{downsize}}
#' @description Utility function. Throw an error when downsizing fails.
downsize_error = function(arg_name){
  stop(paste0("Could not downsize \"big\" by setting argument \"", arg_name, "\"."))
}

#' @title Internal utility function.
#' @seealso \code{\link{downsize}}
#' @param args named list of arguments to \code{\link{downsize}}
#' @description Utility function. Inside function \code{\link{downsize}}, 
#' make "small" out of "big" 
#' by subsetting or some other method. This is called if any of 
#' the subsetting arguments to \code{\link{downsize}} are set (length, dim, etc.)
make_small = function(args){
  check_args(args)
  if(use_arg_small(args)) return(args$small)
  stopifnot(is.logical(args$random))
  subset_length(args$big, args$length, args$random) %>%
    subset_dim(args$dim, args$random) %>%
    subset_nrow(args$nrow, args$random) %>%
    subset_ncol(args$ncol, args$random)
}

#' @title Internal utility function.
#' @seealso \code{\link{downsize}}
#' @param downsize argument to \code{\link{downsize}}
#' @description Utility function. TRUE/FALSE: should the \code{\link{downsize}} function return 
#' a downsized replacement for "big"?
should_downsize = function(downsize){
  if(is.null(downsize)) downsize = FALSE
  stopifnot(is.logical(downsize))
  downsize
}

#' @title Internal utility function.
#' @seealso \code{\link{downsize}}
#' @param args named list of arguments to \code{\link{downsize}}
#' @description Utility function. Should the "small" argument to 
#' \code{\link{downsize}} be used? Returns \code{TRUE} if none 
#' of the subsetting arguments (length, dim, etc.) or similar is set.
use_arg_small = function(args){
  subsetters = args[setdiff(names(args), c("big", "small", "downsize", "random"))]
  all(sapply(subsetters, is.null))
}
