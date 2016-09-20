This is the first submission of `downsize` to CRAN. 

When I tested via `R CMD CHECK --as-cran` in R 3.3.1 on Mac OS 10.11.6, and there were no warnings or errors. The only note was the following.

```
* checking CRAN incoming feasibility ... NOTE
Maintainer: ‘Landau William <will.landau@gmail.com>’

New submission
```

I also tested via `devtools::build_win()`. As before, there were no warnings or errors. There was only one note, and it was similar to the one from Mac OS.

```
* checking CRAN incoming feasibility ... NOTE
Maintainer: 'Landau William <will.landau@gmail.com>'

New submission

Possibly mis-spelled words in DESCRIPTION:
  Workflows (2:35)
  workflow (7:66)
```

I believe that "Workflows" and "workflow" are spelled correctly.

Build checks successfully passed on [AppVeyor](https://ci.appveyor.com/project/wlandau/downsize) and [Travis CI](https://travis-ci.org/wlandau/downsize). 100% of the code is [unit-tested](https://codecov.io/github/wlandau/downsize?branch=master) via `testthat`. The latest build status is displayed with the badges at the top of the [README](https://github.com/wlandau/downsize/blob/master/README.md).

Thank you for your consideration.
