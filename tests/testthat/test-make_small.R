# library(testthat); library(downsize)
context("make_small")

test_that("Function make_small() runs correctly", {
  set.seed(0)
  data(mtcars)
  args = list(big = rbind(mtcars, mtcars), small = mtcars, random = F, downsize = T, warn = T)
  args0 = args
  expect_equal(make_small(args), args$small)

  args$nrow = 5
  expect_error(make_small(args))

  args$small = args0$small = NULL
  args$nrow = 5
  expect_equal(make_small(args), args$big[1:5,])

  args = args0
  args$ncol = 4
  expect_equal(make_small(args), args$big[,1:4])

  args$dim = 2:3
  expect_equal(make_small(args), args$big[1:2,1:3])

  args = args0
  args$ncol = 4
  args$big = array(rnorm(2*1e5*3), dim = c(2, 1e3, 3))
  expect_equal(make_small(args), args$big[1:2,1:4,1:3])

  args$dim = c(Inf, 2, 2)
  expect_equal(make_small(args), args$big[,1:2,1:2])

  args$dim = c(Inf, 2, 2)
  args$random = T
  expect_equal(dim(make_small(args)), dim(args$big[,1:2,1:2]))
  expect_false(identical(make_small(args), args$big[,1:2,1:2]))
})
