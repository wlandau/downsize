# library(testthat); library(downsize)
context("subset_dim")

test_that("Function subset_dim() runs correctly", {
  set.seed(0)
  data(mtcars)
  a = mtcars
  b = matrix(rnorm(800), nrow = 100)
  d = array(sample.int(60), dim = 5:3)

  expect_error(subset_dim(1:5, 1, F))
  expect_error(subset_dim(a, c(-1, 4), F))
  expect_error(subset_dim(a, c(1, -4), F))
  expect_error(subset_dim(a, c(-1, -4), F))

  expect_equal(subset_dim(a, NULL, F), a)
  expect_equal(subset_dim(a, c(2, 3), F), a[1:2,1:3])

  x = subset_dim(b, c(4, 5), T)
  expect_equal(dim(x), dim(b[1:4,1:5, drop = F]))
  expect_false(identical(x, b[1:4, 1:5]))

  x = subset_dim(b, c(1, 7), T)
  expect_equal(dim(x), dim(b[1,1:7, drop = F]))
  expect_false(identical(x, b[1,1:7, drop = F]))

  expect_equal(subset_dim(d, c(2, 2, 2), F), d[1:2,1:2,1:2])
  expect_equal(subset_dim(d, c(100, 2, 100), F), d[,1:2,])
  expect_equal(subset_dim(d, c(1, 100, 1), F), d[1,,1, drop = FALSE])
  expect_equal(subset_dim(d, c(100, 1, 100), F), d[,1,, drop = FALSE])
  expect_equal(subset_dim(d, c(100, 100, 1), F), d[,,1, drop = FALSE])
  expect_equal(subset_dim(d, c(100, 100, 100), F), d)
})
