# Set the "downsize" option to FALSE when the package or namespace is loaded.
.onLoad = function(libname, pkgname){
  opts = list(
    "downsize" = FALSE
  )
  for(o in names(opts))
    if(!is.null(unlist(options(o))))
      opts = opts[names(opts) != o]
  options(opts)
}
