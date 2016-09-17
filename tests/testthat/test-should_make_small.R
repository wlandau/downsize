# library(testthat); library(downsize)
context("should_make_small")

test_that("Function should_make_small() runs correctly", {
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
  
  expect_error(should_make_small())
  expect_false(should_make_small(l))
  for(args in k) expect_true(should_make_small(args))
})
