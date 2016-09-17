# library(testthat); library(downsize)
context("subset_nrow")

test_that("Function subset_nrow() runs correctly", {
  set.seed(0)
  data(mtcars)
  a = mtcars
  d = array(sample.int(60), dim = 5:3)

  expect_error(subset_nrow(1:5, 1, F))
  expect_error(subset_nrow(a, -1, F))

  expect_equal(subset_nrow(a, 3, F), a[1:3,])
  expect_equal(subset_nrow(a, NULL, F), a)
  expect_equal(subset_nrow(a, 1e4, F), a)

  b = matrix(rnorm(2*400), nrow = 400)
  x = subset_nrow(b, 1, T)
  expect_equal(dim(x), dim(b[1,, drop = F]))
  expect_false(identical(x, b[1,]))

  expect_equal(subset_nrow(d, 2, F), d[1:2,,])
  expect_equal(subset_nrow(d, Inf, F), d)
  expect_equal(subset_nrow(d, 1, F), d[1,,, drop = F])
})
