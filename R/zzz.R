.onLoad = function(libname, pkgname){
  opts = list(
    "downsize" = FALSE
  )
  for(o in names(opts))
    if(!is.null(unlist(options(o))))
      opts = opts[names(opts) != o]
  options(opts)
}
