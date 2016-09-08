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

The command `ds(A, ...)` says "Downsize A when `getOption("downsize")` is `TRUE`".

```{r}
library(downsize)
ds("Leave me alone when the downsize option is FALSE.", "Return me when downsize option is TRUE.")
ds(1:10, length = 2)
m = matrix(1:36, ncol = 6)
ds(m, ncol = 2)
ds(m, ncol = 2, random = T)
ds(m, nrow = 2)
ds(m, dim = c(2, 2))
ds(data.frame(x = 1:10, y = 1:10), nrow = 5)
dim(ds(array(0, dim = c(10, 100, 2, 300, 12)), dim = rep(3, 5)))
```

After running the above commands, enter `scale_down()` and run them again to see what changes. Function `scale_down()` is equivalent to `options(downsize = TRUE)`, and `scale_up()` is equivalent to `options(downsize = FALSE)` (default setting).

For atomic objects, setting `random` to `TRUE` in the `ds` function takes a random subset of elements instead of simply the first few.

The <a href="https://github.com/wlandau/downsize">downsize</a> package is compatible with <a href="https://github.com/wlandau/remakeGenerator">remakeGenerator</a> workflows, and the <a href="https://github.com/wlandau/remakeGenerator">remakeGenerator</a> README suggests one of many potential ways to use the two together.
