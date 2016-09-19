# downsize

[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/wlandau/downsize?branch=master&svg=true)](https://ci.appveyor.com/project/wlandau/downsize)
[![Travis-CI Build Status](https://travis-ci.org/wlandau/downsize.svg?branch=master)](https://travis-ci.org/wlandau/downsize)
[![codecov.io](https://codecov.io/github/wlandau/downsize/coverage.svg?branch=master)](https://codecov.io/github/wlandau/downsize?branch=master)

If you have a time-consuming workflow, it may be prudent to try a scaled-down
dry run first. If you intersperse your code with enough calls to `downsize()`, 
it is trivially easy to scale the workload up or down. 
That way, your entire workflow becomes a quick unit test with as little change as possible.

# Installation

Ensure that [R](https://www.r-project.org/) is installed, as well as the dependencies in the [`DESCRIPTION`](https://github.com/wlandau/downsize/blob/master/DESCRIPTION). Then, you can install one of the [stable releases](https://github.com/wlandau/downsize/releases). Download the `.tar.gz` file, open an R session, and run the following.

```r
install.packages("downsize_0.1.0.tar.gz", repos = NULL, type = "source")
```

Where `"downsize_0.1.0.tar.gz"` may be replaced by another version. To install the development version, open an R session and run 

```
> library(devtools)
> install_github("wlandau/downsize")
```

# Tutorial

Say you want to analyze a large dataset.

```r
> big_data <- data.frame(x = rnorm(1e4), y = rnorm(1e4))
```

But for the sake of time, you want to test and debug your code on a smaller dataset.

```r
> small_data <- head(big_data)
```

In your code, define your dataset with a call to `downsize()`.

```r
library(downsize)
my_data <- downsize(big_data, small_data)
```

The `downsize()` function provides a choice between datasets. 
It executes `my_data <- big_data` if `getOption("downsize")` is `FALSE` or `NULL` (default) and `my_data <- small_data` if `getOption("downsize")` is `TRUE`. 
You can toggle the global option `downsize` with a call to `scale_up()` or `scale_down()`, and you can check the status with `scaling()`.

```r
> scale_down()
> scaling()
[1] "scaled down"
> my_data <- downsize(big_data, small_data)
> all(my_data == small_data)
[1] TRUE
> scale_up()
> scaling()
[1] "scaled up"
> my_data <- downsize(big_data, small_data)
> all(my_data == big_data)
[1] TRUE
```

In this case, `my_data <- downsize(big_data, small_data)` is equivalent to `my_data <- downsize(big_data, nrow = 6)`. You can override the global option `downsize` with `downsize(..., downsize = L)`, where `L` is `TRUE` or `FALSE`.

For more examples, run the following lines in a new R session. Then, enter `scale_down()` and run those lines again to see what changes.

```{r}
library(downsize)
downsize("Leave me alone when the downsize option is FALSE.", 
  "Return me when the downsize option is TRUE.")
downsize(1:10, length = 2)
m <- matrix(1:36, ncol = 6)
downsize(m, ncol = 2)
downsize(m, ncol = 2, random = T)
downsize(m, nrow = 2)
downsize(m, dim = c(2, 2))
downsize(data.frame(x = 1:10, y = 1:10), nrow = 5)
dim(downsize(array(0, dim = c(10, 100, 2, 300, 12)), dim = rep(3, 5)))
```
