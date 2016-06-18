# library(testthat); library(downsize)
context("get_indices")

test_that("Function get_indices runs correctly", {
  expect_equal(get_indices(5, 3), 1:3)
  set.seed(0)
  x = get_indices(1e3, 3, random = T)
  expect_equal(length(x), 3)
  expect_true(all(x < 1e3 & x > 0))
  expect_true(is.integer(x))
  expect_false(any(x == 1:3))
})
