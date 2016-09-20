# library(testthat); library(downsize)
context("use_arg_small")

test_that("Function use_arg_small() runs correctly", {
  data(mtcars)
  l = list(big = rbind(mtcars, mtcars), small = mtcars, downsize = TRUE, random = TRUE)
  l2 = l
  l2$small = NULL
  expect_error(arg_small())
  expect_equal(arg_small(l), mtcars)
  expect_equal(arg_small(l2), head(mtcars))
})
