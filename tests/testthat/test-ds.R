# library(testthat); library(downsize)
context("ds")

test_that("Deprecated function ds() runs correctly", {
  expect_warning(x <- ds(1:10, 2))
})
