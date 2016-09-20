# library(testthat); library(downsize)
context("check_downsized")

test_that("Function check_downsized() runs correctly", {
  data(mtcars)
  x = mtcars
  y = mtcars
  rownames(y) = NULL
  z = rbind(x, x)
  expect_error(check_downsized())
  expect_silent(check_downsized(x, y))
  expect_silent(check_downsized(z, x))
  expect_silent(check_downsized(z, y))
  expect_warning(check_downsized(x, x))
  expect_warning(check_downsized(y, x))
  expect_warning(check_downsized(x, z))
})
