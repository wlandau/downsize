# library(testthat); library(downsize)
context("subset_single_dim")

test_that("Function subset_single_dim() runs correctly", {
  set.seed(0)
  data(mtcars)
  a = mtcars
  d = array(sample.int(60), dim = 5:3)

  expect_error(subset_single_dim(a, 0, 1, F))
  expect_error(subset_single_dim(a, 1, 0, F))
  expect_error(subset_single_dim(a, -10, -72, F))

  expect_equal(subset_single_dim(a, NULL, 2, F), a)
  expect_equal(subset_single_dim(a, 2, NULL, F), a)
  expect_equal(subset_single_dim(a, NULL, NULL, F), a)

  expect_equal(subset_single_dim(a, 1, 2, F), a[1:2,])
  expect_equal(subset_single_dim(a, 2, 2, F), a[,1:2])

  b = matrix(rnorm(800), nrow = 400)
  x = subset_single_dim(b, 1, 2, T)
  expect_equal(dim(x), dim(b[1:2,]))
  expect_false(identical(x, b[1:2,]))

  b = matrix(rnorm(800), ncol = 400)
  x = subset_single_dim(b, 2, 2, T)
  expect_equal(dim(x), dim(b[,1:2]))
  expect_false(identical(x, b[,1:2]))

  expect_equal(subset_single_dim(d, 1, 2, F), d[1:2,,])
  expect_equal(subset_single_dim(d, 2, 2, F), d[,1:2,])
  expect_equal(subset_single_dim(d, 3, 2, F), d[,,1:2])
  expect_equal(subset_single_dim(d, 3, 200, F), d)
  expect_equal(subset_single_dim(d, 3, 2, F), d[,,1:2, drop = FALSE])
})
