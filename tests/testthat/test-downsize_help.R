# library(testthat); library(downsize)
context("downsize_help")

test_that("Function downsize_help() runs correctly", {
  expect_output(downsize_help())
})
