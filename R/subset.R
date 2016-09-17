# Subset an object "x" with a "dim" attribute (matrix/array/data.frame/etc.)
# and return another with dimensions pmin(dim, dim(x))
subset_dim = function(x, dim, random){
  tryCatch({
    for(i in 1:length(dim)) x = subset_single_dim(x, i, dim[i], random)
    x
  }, error = function(e) ds_error("dim"))
}

# Subset a vector/list/etc. "x" and return another with length min(length, length(x))
subset_length = function(x, length, random){
  tryCatch({
    if(random) x = sample(x, replace = FALSE)
    x[1:min(length, length(x))]
  }, error = function(e) ds_error("length"))
}

# Subset an object "x" with columns and return another with 
# min(ncol, ncol(x)) columns.
subset_ncol = function(x, ncol, random){
  tryCatch({
    subset_single_dim(x, 1, ncol, random)
  }, error = function(e) ds_error("ncol"))
}

# Subset an object "x" with rows and return another with 
# min(nrow, nrow(x)) rows.
subset_nrow = function(x, nrow, random){
  tryCatch({
    subset_single_dim(x, 1, nrow, random)
  }, error = function(e) ds_error("nrow"))
}

# Same as subset_dim, but along the single dimension with index "which_dim".
subset_single_dim = function(x, which_dim, dim_length, random){
  n = dim(x)[which_dim]
  dim_length = min(n, dim_length)
  i = 1:dim_length
  if(random) i = sample.int(n, size = dim_length, replace = FALSE)
  extract.array(x, indices = list(i), dims = which_dim)
}
