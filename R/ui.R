#' @title Function \code{scale_down}
#' @description Calls \code{options(downsize = TRUE)} to scale down a workflow.
#' This affects the \code{\link{downsize}} function.
#' @seealso \code{\link{downsize}}, \code{\link{downsize}}, \code{\link{scale_up}},
#' \code{\link{scaling}}
#' @export
scale_down = function(){
  options(downsize = TRUE)	
}

#' @title Function \code{scale_up}
#' @description Call \code{options(downsize = FALSE)} to scale up a workflow.
#' This affects the \code{\link{downsize}} function.
#' @seealso \code{\link{downsize}}, \code{\link{scale_down}}, 
#' \code{\link{scaling}}
#' @export
scale_up = function(){
  options(downsize = FALSE)	
}

#' @title Function \code{scaling}
#' @description Check whether the current workflow is scaled up or down.
#' @seealso \code{\link{downsize}}, \code{\link{scale_down}}, 
#' \code{\link{scale_up}}
#' @export
#' @return \code{"scaled down"} if \code{getOption("downsize")} is \code{TRUE} 
#' and "scaled up" if \code{getOption("downsize")} is \code{FALSE} or \code{NULL}.
scaling = function(){
  downsize = getOption("downsize")
  if(is.null(downsize)) downsize = FALSE	
  ifelse(downsize, "scaled down", "scaled up")
}

#' @title Function \code{downsize}. Main function of the \code{downsize} package.
#' @description Replace \code{big} with a downsized object 
#' if the \code{downsize} argument (or global \code{downsize} option) is \code{TRUE}.
#' @details If the \code{downsize} argument is \code{TRUE}, a downsized replacement 
#' for \code{big} will be returned. In this case, arguments \code{dim}, \code{length},
#'  etc. take precedence over \code{small}. If the \code{downsize} argument is not set 
#' manually, the global option \code{downsize} will be used. The \code{downsize} option 
#' can be toggled with functions \code{\link{scale_down}} and \code{\link{scale_up}}.
#' @seealso \code{\link{scale_down}}, \code{\link{scale_up}}, \code{\link{scaling}}
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
downsize = function(big, small = NULL, downsize = getOption("downsize"), warn = TRUE,
  random = FALSE, length = NULL, dim = NULL, ncol = NULL, nrow = NULL){
  if(!should_downsize(downsize)) return(big)
  args = mget(names(formals()),sys.frame(sys.nframe()))
  small = make_small(args)
  if(warn) check_downsized(big, small)
  small
}
