# library(testthat); library(downsize)
context("check_args")

test_that("Function check_args() runs correctly", {
  data(mtcars)
  for(r in c(T, F)) for(d in c(T, F)){
    args = list(big = rbind(mtcars, mtcars), small = mtcars, random = r, downsize = d)
    expect_error(check_args(args))
    args$warn = T
    expect_silent(check_args(args))
    x = args
    x$random = NULL
    expect_error(check_args(x))
    x$random = "random"
    expect_error(check_args(x))
    expect_error(check_args(c(args, length = 2)))
    expect_error(check_args(c(args, nrow = 4)))
    expect_error(check_args(c(args, ncol = 4)))
    expect_error(check_args(c(args, dim = c(5, 1))))
    expect_error(check_args(c(args, nrow = 2, dim = c(5, 1))))
    expect_error(check_args(list(big = 10)))
  }
})
