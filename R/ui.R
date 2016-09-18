#' @title Function \code{downsize}
#' @description Same as the \code{\link{scale_down}} function. 
#' Calls \code{options(downsize = TRUE)} to scale down a workflow.
#' This affects the \code{ds()} function.
#' @seealso \code{\link{ds}}, \code{\link{scale_down}}, \code{\link{scale_up}},
#' \code{\link{scaling}}
#' @export
downsize = function(){
  scale_down()
}

#' @title Function \code{scale_down}
#' @description Same as the \code{\link{downsize}} function. 
#' Calls \code{options(downsize = TRUE)} to scale down a workflow.
#' This affects the \code{ds()} function.
#' @seealso \code{\link{ds}}, \code{\link{downsize}}, \code{\link{scale_up}},
#' \code{\link{scaling}}
#' @export
scale_down = function(){
  options(downsize = TRUE)	
}

#' @title Function \code{scale_up}
#' @description Call \code{options(downsize = TRUE)} to scale up a workflow.
#' This affects the \code{ds()} function.
#' @seealso \code{\link{ds}}, \code{\link{scale_down}}, \code{\link{scaling}}
#' @export
scale_up = function(){
  options(downsize = FALSE)	
}

#' @title Function \code{scaling}
#' @description Check whether the current workflow is scaled up or down.
#' @seealso \code{\link{ds}}, \code{\link{scale_down}}, \code{\link{scale_up}}
#' @export
scaling = function(){
  downsize = getOption("downsize")
  if(is.null(downsize)) downsize = FALSE	
  ifelse(downsize, "downsized", "scaled up")
}

#' @title Function \code{ds}. Main function of the \code{downsize} package.
#' @description Downsize \code{big} if \code{downsize} is \code{TRUE}.
#' @details If \code{downsize} is \code{TRUE}, a downsized replacement for \code{big} 
#' will be returned. In this case, arguments \code{dim}, \code{length}, etc. take 
#' precedence over \code{small}. If the \code{downsize} argument is not set manually, 
#' the global option \code{downsize} will be used. The \code{downsize} option can be 
#' toggled with \code{\link{scale_down}}
#' and \code{\link{scale_up}}.
#' @seealso \code{\link{scale_down}}, \code{\link{scale_up}}, \code{\link{scaling}}
#' @export
#' @return A downsized object if \code{downsize} is \code{TRUE} and \code{big} otherwise.
#' @param big Object to return if \code{downsize} is \code{FALSE} or \code{NULL}.
#' @param small Object to return if \code{downsize} is \code{TRUE} and all subsetter 
#' arguments such as \code{length} and \code{dim} are \code{NULL}.
#' @param downsize \code{TRUE}/\code{FALSE} value (\code{NULL} counts as \code{FALSE}), 
#' whether to replace \code{big} with a downsized object.
#' Defaults to the global option \code{downsize}, which you can check with
# '\code{getOption("downsize")} and set with \code{\link{scale_down}} or \code{\link{scale_up}}.
#' @param length Downsize \code{big} to this length if \code{downsize} is \code{TRUE}.
#' @param dim Downsize \code{big} to these dimensions if \code{downsize} is \code{TRUE}.
#' @param ncol Downsize \code{big} to this number of columns if \code{downsize} is \code{TRUE}.
#' @param nrow Downsize \code{big} to this number of rows if \code{downsize} is \code{TRUE}.
#' @param random If \code{TRUE}, take a random subset of \code{big} instead
#' of the first few elements. For example, if \code{nrow = 3}, take a random 
#' 3 rows instead of the first 3.
ds = function(big, small = big, downsize = getOption("downsize"), random = FALSE,
  length = NULL, dim = NULL, ncol = NULL, nrow = NULL){
  args = mget(names(formals()),sys.frame(sys.nframe()))
  if(!should_downsize(downsize)) return(big)
  if(should_make_small(args)) small = make_small(args)
  check_small(big, small)
  small
}
