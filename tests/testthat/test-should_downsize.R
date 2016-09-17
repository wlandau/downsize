# library(testthat); library(downsize)
context("should_downsize()")

test_that("Function should_downsize() runs correctly", {
  expect_error(should_downsize())
  expect_error(should_downsize("string"))
  expect_false(should_downsize(NULL))
  expect_false(should_downsize(FALSE))
  expect_true(should_downsize(TRUE))
})
