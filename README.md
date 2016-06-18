When I'm setting up a reproducible workflow, I don't run the 
full scaled-up workflow right away. I first run a downsized 
version to test and debug. This package helps with the downsizing. 
It can be used to shrink the size of datasets, the number of 
Monte Carlo iterations to run, etc. 
With the `ds` function, objects are downsized if 
`getOption("downsize")` is `TRUE` and left alone otherwise.

Here are some examples. 

```{r}
ds("Leave me alone when downsize is FALSE.", "Return me when downsize is TRUE.")
ds(1:100)
ds(1:100, length = 2)
m = matrix(1:144, ncol = 12)
ds(m, ncol = 2)
ds(m, nrow = 2)
ds(m, dim = rep(2, 2))
ds(data.frame(x = 1:25, y = 1:25))
ds(array(0, dim = c(10, 2, 100, 2, 12)))
```

Now try running the above after entering `options(downsize = TRUE)`
