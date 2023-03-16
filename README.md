# downsize

With the `downsize` R package, you can toggle the test and production versions of your workflow with the flip of a `TRUE/FALSE` global option. This is helpful when your workflow takes a long time to run, you want to test it quickly, and unit testing is too reductionist to cover everything.

# Installation

First, ensure that [R](https://www.r-project.org/) is installed, as well as the dependencies in the [`DESCRIPTION`](https://github.com/wlandau/downsize/blob/master/DESCRIPTION). To install the [latest CRAN release](https://cran.r-project.org/web/packages/downsize/), run

```r
install.packages("downsize")
```

To install the development version, get the [devtools](https://cran.r-project.org/web/packages/devtools/) package and then run 

```r
devtools::install_github("wlandau/downsize", build = TRUE)
```

If you specify a tag, you can install a GitHub release.

```r
devtools::install_github("wlandau/downsize@v0.2.1", build = TRUE)
```


# Tutorial

The [online package vignette](http://will-landau.com/downsize/articles/downsize.html) has a complete tutorial. You can the load the compiled version from an R session.

```r
vignette("downsize")
```


# Help and troubleshooting

Use the `help_downsize()` function to obtain a collection of helpful links. For troubleshooting, please refer to [TROUBLESHOOTING.md](https://github.com/wlandau/downsize/blob/master/TROUBLESHOOTING.md) on the [GitHub page](https://github.com/wlandau/downsize) for instructions.
