# downsize

[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/wlandau/downsize?branch=master&svg=true)](https://ci.appveyor.com/project/wlandau/downsize)
[![Travis-CI Build Status](https://travis-ci.org/wlandau/downsize.svg?branch=master)](https://travis-ci.org/wlandau/downsize)
[![codecov.io](https://codecov.io/github/wlandau/downsize/coverage.svg?branch=master)](https://codecov.io/github/wlandau/downsize?branch=master)

If you have time-consuming workflow, it may be prudent to try a downsized
dry run first. If you intersperse your code with enough calls to `downsize::ds()`, 
it is trivially easy to scale the workload up or down. 
That way, your entire workflow becomes a quick unit test with as little change as possible.

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

# Tutorial

Say you want to analyze a large dataset.

```r
> big_data <- data.frame(x = rnorm(1e4), y = rnorm(1e4))
```

But for the sake of time, you want to test and debug your code on a smaller dataset.

```r
> small_data <- head(big_data)
```

In your code, define your dataset with a call to `ds()`.

```r
library(downsize)
my_data <- ds(big_data, small_data)
```

The `ds()` function provides a choice between datasets. 
It executes `my_data <- big_data` if `getOption("downsize")` is `FALSE` or `NULL` (default) and `my_data <- small_data` if `getOption("downsize")` is `TRUE`. 
You can toggle the global option `downsize` with a call to `scale_up()` or `downsize()` (same as `scale_down()`), and you can check the status with `scaling()`.

```r
> downsize() # same as scale_down()
> scaling()
[1] "downsized"
> my_data <- ds(big_data, small_data)
> all(my_data == small_data)
[1] TRUE
> scale_up()
> scaling()
[1] "scaled up"
> my_data <- ds(big_data, small_data)
> all(my_data == big_data)
[1] TRUE
```

In this case, `my_data <- ds(big_data, small_data)` is equivalent to `my_data <- ds(big_data, nrow = 6)`. You can override the global option `downsize` with `ds(..., downsize = L)`, where `L` is `TRUE` or `FALSE`.

For more examples, run the following lines in a new R session. Then, enter `downsize()` (same as `scale_down()`) and run those lines again to see what changes.

```{r}
library(downsize)
ds("Leave me alone when the downsize option is FALSE.", 
  "Return me when downsize option is TRUE.")
ds(1:10, length = 2)
m <- matrix(1:36, ncol = 6)
ds(m, ncol = 2)
ds(m, ncol = 2, random = T)
ds(m, nrow = 2)
ds(m, dim = c(2, 2))
ds(data.frame(x = 1:10, y = 1:10), nrow = 5)
dim(ds(array(0, dim = c(10, 100, 2, 300, 12)), dim = rep(3, 5)))
```
