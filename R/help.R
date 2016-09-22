#' @title Function \code{help_downsize}
#' @description Prints links for tutorials, troubleshooting, bug reports, etc.
#' @seealso \code{\link{downsize}}, \code{\link{scale_down}}, 
#' \code{\link{scale_up}}, \code{\link{scaling}}
#' @export
help_downsize = function(){
  cat(
    "The package vignette has a full tutorial, and it is available at the following webpages.",
    "    https://CRAN.R-project.org/package=downsize/vignettes/downsize.html",
    "    https://cran.r-project.org/web/packages/downsize/vignettes/downsize.html",
    "The vignette of the development version has a full tutorial at the webpage below.",
    "    https://github.com/wlandau/downsize/blob/master/vignettes/downsize.Rmd",
    "For troubleshooting, navigate to the link below.",
    "    https://github.com/wlandau/downsize/blob/master/TROUBLESHOOTING.md",
    "To submit bug reports, usage questions, feature requests, etc., navigate to the link below.",
    "    https://github.com/wlandau/downsize/issues",
  sep = "\n")
}
