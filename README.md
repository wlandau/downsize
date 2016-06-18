When I'm setting up a reproducible workflow, I don't run the 
full scaled-up workflow right away. I first run a downsized 
version to test and debug. This package helps with the downsizing. 
It can be used to shrink the size of datasets, the number of 
Monte Carlo iterations to run, etc. 
With the `ds` function, objects are downsized if 
`getOption("downsize")` is `TRUE` and left alone otherwise.

Here are some examples. 

```{r}
library(downsize)
ds("Leave me alone when downsize is FALSE.", "Return me when downsize is TRUE.")
ds(1:10, length = 2)
m = matrix(1:36, ncol = 6)
ds(m, ncol = 2)
ds(m, nrow = 2)
ds(m, dim = c(2, 2))
ds(data.frame(x = 1:10, y = 1:10), nrow = 5)
dim(ds(array(0, dim = c(10, 100, 2, 300, 12)), dim = rep(3, 5)))
```

Now try running the above after entering `options(downsize = TRUE)`
