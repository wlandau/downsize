library(testthat)
library(downsize)

Sys.setenv("R_TESTS" = "")
test_check("downsize")
