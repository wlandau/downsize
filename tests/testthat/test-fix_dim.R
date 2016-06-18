# library(testthat); library(downsize)
context("fix_dim")

test_that("Function fix_dim runs correctly", {
  A = 1:80
  B = matrix(1:120, ncol = 10)
  C = array(0, dim = c(10, 2, 100, 2, 12))

  expect_equal(fix_dim(A), length(A))
  expect_equal(fix_dim(A, dim = 2:3), 2)
  expect_equal(fix_dim(A, length = length(A) + 10), length(A))
  expect_equal(fix_dim(A, length = 5), 5)
  expect_equal(fix_dim(A, nrow = 5), 80)
  expect_equal(fix_dim(A, nrow = 500), 80)
  expect_equal(fix_dim(A, ncol = 5), 80)
  expect_equal(fix_dim(A, ncol = 500), 80)
  
  expect_equal(fix_dim(B), dim(B))
  expect_equal(fix_dim(B, dim = 1), c(1,1))
  expect_equal(fix_dim(B, dim = 1:2), 1:2)
  expect_warning(fix_dim(B, dim = 1:3))
  expect_equal(fix_dim(B, length = length(A) + 10), dim(B))
  expect_equal(fix_dim(B, length = 5), dim(B))
  expect_equal(fix_dim(B, nrow = 5), c(5, dim(B)[2]))
  expect_equal(fix_dim(B, nrow = 500), dim(B))
  expect_equal(fix_dim(B, ncol = 5), c(dim(B)[1], 5))
  expect_equal(fix_dim(B, ncol = 500), dim(B))
})
