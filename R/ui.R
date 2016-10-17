#' @title Function \code{downsize}. Main function of the \code{downsize} package.
#' @description Replace \code{big} with a downsized object 
#' if the \code{downsize} argument (or the \code{downsize} global option) is \code{TRUE}.
#' The \code{downsize} global option can be toggled with functions 
#' \code{\link{test_mode}} and \code{\link{production_mode}}.
#' Use the \code{\link{help_downsize}} function to get more help.
#' @details Use the \code{\link{help_downsize}} function to get more help.
#' If the \code{downsize} argument is \code{TRUE}, a downsized replacement 
#' for \code{big} will be returned. In this case, argument \code{small} takes precedence
#' over subsetter arguments such as \code{dim}, \code{length}, \code{nrow}, and \code{ncol}.
#' That is, if \code{small} is not \code{NULL}, then \code{small} will be returned even if 
#' \code{dim} is not \code{NULL}.
#' If the \code{downsize} argument is not set 
#' manually, the \code{downsize} global option will be used. The \code{downsize} global option 
#' can be toggled with functions \code{\link{test_mode}} and \code{\link{production_mode}}.
#' @seealso \code{\link{help_downsize}}, \code{\link{test_mode}}, 
#' \code{\link{production_mode}}, \code{\link{my_mode}}
#' @export
#' @return A downsized object if \code{downsize} is \code{TRUE} and \code{big} otherwise.
#' @param big Object to return if \code{downsize} is \code{FALSE} or \code{NULL}.
#' @param small Object to return if \code{downsize} is \code{TRUE} and all subsetter 
#' arguments such as \code{length} and \code{dim} are \code{NULL}.
#' @param downsize \code{TRUE}/\code{FALSE} value (\code{NULL} counts as \code{FALSE}), 
#' whether to replace \code{big} with a downsized object.
#' Defaults to the global option \code{downsize}, which you can check with
#' \code{getOption("downsize")} or the \code{\link{my_mode}} function and set with functions
#' \code{\link{downsize}}, \code{\link{test_mode}} or \code{\link{production_mode}}.
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
  if(!should_downsize(downsize)){ 
    return(big)
  } else if(!is.null(small)) {
    return(small)
  }
  args = mget(names(formals()),sys.frame(sys.nframe()))
  make_small(args)
}

#' @title Function \code{my_mode}
#' @description Check whether the current workflow is production mode or test mode.
#' Use the \code{\link{help_downsize}} function to get more help.
#' @details Use the \code{\link{help_downsize}} function to get more help.
#' @seealso \code{\link{help_downsize}}, \code{\link{downsize}}, 
#' \code{\link{test_mode}}, \code{\link{production_mode}}
#' @export
#' @return \code{"test mode"} if \code{getOption("downsize")} is \code{TRUE} 
#' and "production mode" if \code{getOption("downsize")} is \code{FALSE} or \code{NULL}.
my_mode = function(){
  downsize = getOption("downsize")
  if(is.null(downsize)) downsize = FALSE	
  ifelse(downsize, "test mode", "production mode")
}

#' @title Function \code{production_mode}
#' @description Calls \code{options(downsize = FALSE)} to scale up a workflow
#' to production mode.
#' This affects the \code{\link{downsize}} function.
#' Use the \code{\link{help_downsize}} function to get more help.
#' @details Use the \code{\link{help_downsize}} function to get more help.
#' @seealso \code{\link{help_downsize}}, \code{\link{downsize}}, 
#' \code{\link{test_mode}}, \code{\link{my_mode}}
#' @export
production_mode = function(){
  options(downsize = FALSE)	
}

#' @title Function \code{test_mode}
#' @description Calls \code{options(downsize = TRUE)} to scale down a workflow
#' to test mode.
#' This affects the \code{\link{downsize}} function.
#' Use the \code{\link{help_downsize}} function to get more help.
#' @details Use the \code{\link{help_downsize}} function to get more help.
#' @seealso \code{\link{help_downsize}}, \code{\link{downsize}}, \code{\link{production_mode}}, \code{\link{my_mode}},
#' \code{\link{my_mode}}
#' @export
test_mode = function(){
  options(downsize = TRUE)	
}
