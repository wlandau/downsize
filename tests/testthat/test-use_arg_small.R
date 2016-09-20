# library(testthat); library(downsize)
context("use_arg_small")

test_that("Function use_arg_small() runs correctly", {
  data(mtcars)
  l = list(big = rbind(mtcars, mtcars), small = mtcars, downsize = TRUE, random = TRUE)

  k = list(
    c(l, length = 3),
    c(l, dim = 3),
    c(l, ncol = 3),
    c(l, nrow = 3),
    c(l, length = 5, dim = 5),
    c(l, length = 5, dim = 5, nrow = 7),
    c(l, length = 5, dim = 5, ncol = 1, nrow = 7))
  
  expect_error(use_arg_small())
  expect_true(use_arg_small(l))
  for(args in k) expect_false(use_arg_small(args))
})
