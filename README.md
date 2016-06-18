When I'm setting up a reproducible workflow in R, I don't run the 
full scaled-up workflow right away. I first run a downsized 
version to test and debug. This package helps with the downsizing. 
It can be used to shrink the size of datasets, the number of 
Monte Carlo iterations to run, etc. 
With the `ds` function, objects are downsized if 
`getOption("downsize")` is `TRUE` and left alone otherwise.

# Installation

Ensure that [R](https://www.r-project.org/) is installed, as well as the dependencies in the [`DESCRIPTION`](https://github.com/wlandau/downsize/blob/master/DESCRIPTION). Open an R session and run 

```
library(devtools)
install_github("wlandau/downsize")
```

Alternatively, you can build the package from the source and install it by hand. First, ensure that [git](https://git-scm.com/) is installed. Next, open a [command line program](http://linuxcommand.org/) such as [Terminal](https://en.wikipedia.org/wiki/Terminal_%28OS_X%29) and enter the following commands.

```
git clone git@github.com:wlandau/downsize.git
R CMD build downsize
R CMD INSTALL ...
```

where `...` is replaced by the name of the tarball produced by `R CMD build`.

# Usage

Here are some examples. First, run the following lines by themselves. Then, set `options(downsize = TRUE)` and run them again to see what changes.

```{r}
library(downsize)
ds("Leave me alone when downsize is FALSE.", "Return me when downsize is TRUE.")
ds(1:10, length = 2)
m = matrix(1:36, ncol = 6)
ds(m, ncol = 2)
ds(m, ncol = 2, random = T)
ds(m, nrow = 2)
ds(m, dim = c(2, 2))
ds(data.frame(x = 1:10, y = 1:10), nrow = 5)
dim(ds(array(0, dim = c(10, 100, 2, 300, 12)), dim = rep(3, 5)))
```

For atomic objects, setting `random` to `TRUE` in the `ds` function takes a random subset of elements instead of simply the first few.

# Use with the [workflowHelper](https://github.com/wlandau/workflowHelper) and [parallelRemake](https://github.com/wlandau/parallelRemake) packages

If you're using [workflowHelper](https://github.com/wlandau/workflowHelper), you may want to use `downsize` within your custom R source code. That way, you can run a quick scaled-down version of your workflow for debugging and testing before you run the full workload. In the [workflowHelper](https://github.com/wlandau/workflowHelper) example, just include `downsize` in `packages` inside `workflow.R` and replace the top few lines of `code.R` with the following.

```{r}
options(downsize = TRUE)

poisson_dataset = function(n = 100){
  ds(data.frame(x = rpois(n, 1), y = rpois(n, 5)), nrow = 10)
}

normal_dataset = function(n = 100){
  ds(data.frame(x = rnorm(n, 1), y = rnorm(n, 5)), nrow = 10)
}
```

This sets the `downsize` option and use the `ds` function to shrink the datasets. For the full scaled-up workflow, just replace the first line with `options(downsize = FALSE)`. Unfortunately, [`remake`](https://github.com/richfitz/remake) does not rebuild things when options are changed, so you'll have to run `make clean` whenever you change the `downsize` option. Use with [parallelRemake](https://github.com/wlandau/parallelRemake) is similar.
