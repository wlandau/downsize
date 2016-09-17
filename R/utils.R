# Called if "downsize" is TRUE. Compare "small" to "big" and see if
# the result makes sense.
check_small = function(big, small){
  if(identical(big, small))
    warning("downsizing \"big\" to \"small\", but \"big\" and \"small\" are identical.")
  if(object.size(big) < object.size(small))
    warning("downsizing \"big\" to \"small\", but \"big\" is a smaller object than \"small\".")  
}

# TRUE/FALSE: should the ds() function return a downsized replacement for "big"?
dont_downsize = function(downsize){
  if(is.null(downsize)) downsize = FALSE
  stopifnot(is.logical(downsize))
  !downsize
}

# Throw an error when downsizing fails.
ds_error = function(arg_name){
  stop(paste0("Could not downsize \"big\" by setting \"", arg_name, "\"."))
}

# Inside function ds(), make "small" out of "big" by subsetting or some other method.
# This is called if any of the subsetting arguments to ds() are set (length, dim, etc.)
make_small = function(args){
  stopifnot(is.logical(args$random))
  subset_length(args$big, args$length, args$random) %>%
    subset_dim(args$dim, args$random) %>%
    subset_nrow(args$nrow, args$random) %>%
    subset_ncol(args$ncol, args$random)
}

# Should "small" be made from "big"? Returns true if at least one of the subsetting arguments
# (length, dim, etc.) or similar is set.
should_make_small = function(args){
  subsetters = args[setdiff(names(args), c("big", "small", "downsize"))]
  any(lapply(subsetters, !is.null))
}
