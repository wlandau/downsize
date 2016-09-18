# library(testthat); library(downsize)
context("ds_options")

test_that("Function ds_options() runs correctly", {
  expect_null(ds_options())
  expect_false(getOption("downsize"))
})
