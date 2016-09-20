# library(testthat); library(downsize)
context("downsize")

test_that("Function downsize() selects code blocks correctly", {
  for(i in 1:3){
    scale_down()
    x = downsize(big = {a = 1; a + 10}, small = {a = 1; a + 1})
    expect_equal(x, 2)
    scale_up()
    x = downsize(big = {a = 1; a + 10}, small = {a = 1; a + 1})
    expect_equal(x, 11)
  }

  for(i in 1:3){
    scale_down()
    tmp <- downsize(
      big = {
        x = "long code"
        y = 1:10
      }, 
      small = {
        x = "short code"
        y = 3.14
      })
    expect_equal(x, "short code")
    expect_equal(y, 3.14)
    scale_up()
    tmp <- downsize(
      big = {
        x = "long code"
        y = 1:10
      }, 
      small = {
        x = "short code"
        y = 3.14
      })
    expect_equal(x, "long code")
    expect_equal(y, 1:10)
  }
})

test_that("Function downsize() chooses objects and subsetting correctly", {
  set.seed(0)
  data(mtcars)
  small = mtcars
  big = rbind(mtcars, mtcars)

  scale_up()
  expect_equal(downsize(big), big)
  expect_equal(downsize(big, small), big)
  scale_down()
  expect_equal(downsize(big), head(big))
  expect_equal(downsize(big, small), small)
  expect_equal(downsize(big, small), small)

  expect_warning(downsize(1, 1))
  expect_warning(x <- downsize(1, rnorm(1e3)))
  expect_silent(x <- downsize(1, rnorm(1e3), warn = F))

  expect_error(downsize(big, small = 1, ncol = 0))
  expect_error(downsize(big, ncol = 0))
  expect_error(downsize(big, nrow = 0))
  expect_error(downsize(big, dim = c(0, 0)))

  expect_equal(downsize(big, ncol = 3), big[,1:3])  
  expect_equal(downsize(big, nrow = 2), big[1:2,])  
  expect_equal(downsize(big, ncol = 3, nrow = 2), big[1:2,1:3])  
  expect_equal(downsize(big, ncol = 3, nrow = 2, dim = c(5, 5)), big[1:2,1:3]) 
  expect_equal(downsize(big, ncol = 10, nrow = 27, dim = c(5, 4)), big[1:5,1:4])

  big = array(rnorm(56000), dim = c(7, 1e3, 8))
  expect_equal(downsize(big, ncol = 3), big[,1:3,])  
  expect_equal(downsize(big, nrow = 2), big[1:2,,])  
  expect_equal(downsize(big, ncol = 3, nrow = 2), big[1:2,1:3,])  
  expect_equal(downsize(big, ncol = 3, nrow = 2, dim = c(5, 5)), big[1:2,1:3,]) 
  expect_equal(downsize(big, ncol = 3, nrow = 2, dim = c(5, 5, Inf)), big[1:2,1:3,]) 
  expect_equal(downsize(big, ncol = 10, nrow = 27, dim = c(5, 4)), big[1:5,1:4,])
  expect_equal(downsize(big, ncol = 10, nrow = 27, dim = c(5, Inf,4)), big[1:5,1:10,1:4])

  expect_equal(dim(downsize(big, random = T, ncol = 10, nrow = 27, dim = c(5, Inf,4))), 
    dim(big[1:5,1:10,1:4]))
  expect_false(identical(downsize(big, random = T, ncol = 10, nrow = 27, dim = c(5, Inf,4)), 
    big[1:5,1:10,1:4]))

  big = rnorm(1e3)
  expect_error(downsize(big, ncol = 2))
  expect_error(downsize(big, length = -1))
  expect_equal(downsize(big, length = 5), big[1:5])
  expect_equal(length(downsize(big, length = 5, random = T)), length(big[1:5]))
  expect_false(identical(downsize(big, length = 5, random = T), big[1:5]))
})
