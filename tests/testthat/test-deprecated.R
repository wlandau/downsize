# library(testthat); library(downsize)
context("deprecated")

test_that("Deprecated functions warn correctly", {
  expect_warning(x <- ds(1:10, 2))
  expect_warning(scale_down())
  expect_warning(scale_up())
  expect_warning(scaling())
})