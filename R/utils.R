#' @title Internal utility function.
#' @seealso \code{\link{downsize}}
#' @param args named list of arguments to \code{\link{downsize}}
#' @description Utility function. Make downsized object out of  
#' argument \code{small} to \code{\link{downsize}}.
arg_small = function(args){
  if(use_arg_small(args) & is.null(args$small))
    args$small = head(args$big)
  args$small
}

#' @title Internal utility function.
#' @seealso \code{\link{downsize}}
#' @param args named list of arguments to \code{\link{downsize}}
#' @description Utility function. Checks that arguments are valid.
check_args = function(args){
  stopifnot(is.logical(args$warn) & is.logical(args$random))
  if(!use_arg_small(args) & !is.null(args$small))
    stop("argument \"small\" cannot be used alongside subsetters like \"dim\" and \"length\".")
}

#' @title Internal utility function.
#' @seealso \code{\link{downsize}}
#' @param big argument to \code{\link{downsize}}
#' @param small argument to \code{\link{downsize}}
#' @description Utility function. Checks if downsizing really happened.
check_downsized = function(big, small){
  if(identical(big, small))
    warning("downsized object is identical to \"big\".")
  if(object.size(big) < object.size(small))
    warning("downsized object is bigger in memory than \"big\".")
}

#' @title Internal utility function.
#' @seealso \code{\link{downsize}}
#' @param arg_name name of an argument to \code{\link{downsize}}
#' @description Utility function. Throw an error when downsizing fails.
downsize_error = function(arg_name){
  stop(paste0("could not downsize \"big\" by setting argument \"", arg_name, "\"."))
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
  if(use_arg_small(args)) return(arg_small(args))
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
  subsetters = args[setdiff(names(args), c("big", "small", "downsize", "warn", "random"))]
  all(sapply(subsetters, is.null))
}
