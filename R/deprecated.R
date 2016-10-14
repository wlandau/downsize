#' @title Function \code{ds}. Deprecated.
#' @description Deprecated. Use function \code{\link{downsize}} instead.
#' See \code{\link{help_downsize}} for help.
#' @seealso \code{\link{help_downsize}}, \code{\link{downsize}}, \code{\link{scale_down}}, 
#' \code{\link{scale_up}}, \code{\link{scaling}}
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

#' @title Deprecated function \code{scale_down}
#' @description Deprecated. Use \code{\link{test_mode}} instead.
#' Calls \code{options(downsize = TRUE)} to scale down a workflow.
#' This affects the \code{\link{downsize}} function.
#' Use the \code{\link{help_downsize}} function to get more help.
#' @details Use the \code{\link{help_downsize}} function to get more help.
#' @seealso \code{\link{help_downsize}}, \code{\link{test_mode}}
#' \code{\link{scaling}}
#' @export
scale_down = function(){
  .Deprecated("test_mode", package="downsize")
  options(downsize = TRUE)	
}

#' @title Deprecated function \code{scale_up}
#' @description Deprecated. Use \code{\link{production_mode}} instead.
#' Calls \code{options(downsize = FALSE)} to scale up a workflow.
#' This affects the \code{\link{downsize}} function.
#' Use the \code{\link{help_downsize}} function to get more help.
#' @details Use the \code{\link{help_downsize}} function to get more help.
#' @seealso \code{\link{help_downsize}}, \code{\link{production_mode}}
#' @export
scale_up = function(){
  .Deprecated("production_mode", package="downsize")
  options(downsize = FALSE)	
}

#' @title Deprecated function \code{scaling}
#' @description Deprecated. Use \code{\link{my_mode}} instead.
#' Checks whether the current workflow is scaled up or down.
#' Use the \code{\link{help_downsize}} function to get more help.
#' @details Use the \code{\link{help_downsize}} function to get more help.
#' @seealso \code{\link{help_downsize}}, \code{\link{my_mode}}
#' @export
#' @return \code{"scaled down"} if \code{getOption("downsize")} is \code{TRUE} 
#' and "scaled up" if \code{getOption("downsize")} is \code{FALSE} or \code{NULL}.
scaling = function(){
  .Deprecated("my_mode", package="downsize")
  downsize = getOption("downsize")
  if(is.null(downsize)) downsize = FALSE	
  ifelse(downsize, "scaled down", "scaled up")
}
