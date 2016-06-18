# library(testthat); library(downsize)
context("ds_vector")

test_that("Function ds_vector runs correctly", {
  a = 1:100
  expect_equal(ds_vector(a), a)
  expect_equal(ds_vector(a, length = 2), a[1:2])
  set.seed(0)
  x = ds_vector(a, 2, random = T)
  expect_length(x, 2)
  expect_false(all(x == 1:2))
  expect_equal(ds_vector(a, random = T), a)
})
