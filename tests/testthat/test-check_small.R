# library(testthat); library(downsize)
context("check_small")

test_that("Function check_small() runs correctly", {
  data(mtcars)
  x = mtcars
  y = mtcars
  rownames(y) = NULL
  z = rbind(x, x)
  expect_error(check_small())
  expect_null(check_small(x, y))
  expect_null(check_small(z, x))
  expect_null(check_small(z, y))
  expect_warning(check_small(x, x))
  expect_warning(check_small(y, x))
  expect_warning(check_small(x, z))
})
