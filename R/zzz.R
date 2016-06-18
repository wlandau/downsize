.onLoad = function(libname, pkgname){
  opts = list(
    "downsize" = FALSE,
    "downsize.length" = 10,
    "downsize.dim" = 10
  )
  for(o in names(opts))
    if(!is.null(unlist(options(o))))
      opts = opts[names(opts) != o]
  options(opts)
}
