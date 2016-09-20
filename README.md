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
install.packages("downsize_<VERSION>.tar.gz", repos = NULL, type = "source")
```

where `<VERSION>` is the version number. To install the development version, open an R session and run 

```
> library(devtools)
> install_github("wlandau/downsize")
```

# Tutorial

Please refer to the [online package vignette](https://github.com/wlandau/downsize/blob/master/vignettes/downsize.Rmd) for the tutorial.

# Troubleshooting

Please refer to [TROUBLESHOOTING.md](https://github.com/wlandau/downsize/blob/master/TROUBLESHOOTING.md) on the [GitHub page](https://github.com/wlandau/downsize) for instructions.
