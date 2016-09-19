# library(testthat); library(downsize)
context("ds")

test_that("Deprecated function ds() warns correctly", {
  expect_warning(x <- ds(1:10, 2))
})

test_that("Function ds() runs correctly", {
  set.seed(0)
  data(mtcars)
  small = mtcars
  big = rbind(mtcars, mtcars)

  scale_up()
  expect_equal(suppressWarnings(ds(big)), big)
  expect_equal(suppressWarnings(ds(big, small)), big)
  scale_down()
  expect_equal(suppressWarnings(ds(big, small)), small)
  expect_equal(suppressWarnings(ds(big, small)), small)

  expect_error(suppressWarnings(ds(big, ncol = 0)))
  expect_error(suppressWarnings(ds(big, nrow = 0)))
  expect_error(suppressWarnings(ds(big, dim = c(0, 0))))

  expect_equal(suppressWarnings(ds(big, ncol = 3)), big[,1:3])  
  expect_equal(suppressWarnings(ds(big, nrow = 2)), big[1:2,])  
  expect_equal(suppressWarnings(ds(big, ncol = 3, nrow = 2)), big[1:2,1:3])  
  expect_equal(suppressWarnings(ds(big, ncol = 3, nrow = 2, dim = c(5, 5))), big[1:2,1:3]) 
  expect_equal(suppressWarnings(ds(big, ncol = 10, nrow = 27, dim = c(5, 4))), big[1:5,1:4])

  big = array(rnorm(56000), dim = c(7, 1e3, 8))
  expect_equal(suppressWarnings(ds(big, ncol = 3)), big[,1:3,])  
  expect_equal(suppressWarnings(ds(big, nrow = 2)), big[1:2,,])  
  expect_equal(suppressWarnings(ds(big, ncol = 3, nrow = 2)), big[1:2,1:3,])  
  expect_equal(suppressWarnings(ds(big, ncol = 3, nrow = 2, dim = c(5, 5))), big[1:2,1:3,]) 
  expect_equal(suppressWarnings(ds(big, ncol = 3, nrow = 2, dim = c(5, 5, Inf))), big[1:2,1:3,]) 
  expect_equal(suppressWarnings(ds(big, ncol = 10, nrow = 27, dim = c(5, 4))), big[1:5,1:4,])
  expect_equal(suppressWarnings(ds(big, ncol = 10, nrow = 27, dim = c(5, Inf,4))),
    big[1:5,1:10,1:4])

  expect_equal(
    dim(suppressWarnings(ds(big, random = T, ncol = 10, nrow = 27, dim = c(5, Inf,4)))), 
    dim(big[1:5,1:10,1:4]))
  expect_false(identical(
    suppressWarnings(ds(big, random = T, ncol = 10, nrow = 27, dim = c(5, Inf,4))), 
    big[1:5,1:10,1:4]))

  big = rnorm(1e3)
  expect_error(suppressWarnings(ds(big, ncol = 2)))
  expect_error(suppressWarnings(ds(big, length = -1)))
  expect_equal(suppressWarnings(ds(big, length = 5)), big[1:5])
  expect_equal(length(suppressWarnings(ds(big, length = 5, random = T))), length(big[1:5]))
  expect_false(identical(suppressWarnings(ds(big, length = 5, random = T)), big[1:5]))
})

