# downsize

[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/wlandau/downsize?branch=master&svg=true)](https://ci.appveyor.com/project/wlandau/downsize)
[![Travis-CI Build Status](https://travis-ci.org/wlandau/downsize.svg?branch=master)](https://travis-ci.org/wlandau/downsize)
[![codecov.io](https://codecov.io/github/wlandau/downsize/coverage.svg?branch=master)](https://codecov.io/github/wlandau/downsize?branch=master)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/downsize)](http://cran.r-project.org/package=downsize)

With the `downsize` package, you can toggle the test and production versions of your workflow with the flip of a `TRUE/FALSE` global option. This is helpful when your workflow takes a long time to run, you want to test it quickly, and [unit testing](http://kbroman.org/pkg_primer/pages/tests.html) is too reductionist to cover everything.

# Installation

Ensure that [R](https://www.r-project.org/) is installed, as well as the dependencies in the [`DESCRIPTION`](https://github.com/wlandau/downsize/blob/master/DESCRIPTION). Then, you can install one of the [stable releases](https://github.com/wlandau/downsize/releases). Download `downsize_<VERSION>.tar.gz` (where `<VERSION>` is the version number), open an R session, and run the following.

```r
install.packages("downsize_<VERSION>.tar.gz", repos = NULL, type = "source")
```

To install the development version, open an R session and run 

```
> library(devtools)
> install_github("wlandau/downsize")
```

# Tutorial

Please refer to the [online package vignette](https://github.com/wlandau/downsize/blob/master/vignettes/downsize.Rmd) for the tutorial.

# Troubleshooting

Please refer to [TROUBLESHOOTING.md](https://github.com/wlandau/downsize/blob/master/TROUBLESHOOTING.md) on the [GitHub page](https://github.com/wlandau/downsize) for instructions.
