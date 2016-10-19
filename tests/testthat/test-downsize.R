# library(testthat); library(downsize)
context("downsize")

f = function(){
  downsize(big = {x <- "big"}, small = {x <- "small"})
}

test_that("Function downsize() selects code blocks correctly", {

  x = "global"
  expect_equal(x, "global")
  test_mode()
  expect_equal(f(), "small")
  expect_equal(x, "global")
  production_mode()
  expect_equal(f(), "big")
  expect_equal(x, "global")

  test_mode()
  downsize(big = {a = 1; a + 10}, small = {b = 1; b + 1})
  expect_equal(b, 1)
  expect_error(print(a))

  production_mode()
  downsize(big = {x = 1; x + 10}, small = {y = 1; y + 1})
  expect_equal(x, 1)
  expect_error(print(y))

  for(i in 1:3){
    test_mode()
    x = downsize(big = {a = 1; a + 10}, small = {a = 1; a + 1})
    expect_equal(x, 2)
    production_mode()
    x = downsize(big = {a = 1; a + 10}, small = {a = 1; a + 1})
    expect_equal(x, 11)
  }

  for(i in 1:3){
    test_mode()
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
    production_mode()
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

  production_mode()
  expect_equal(downsize(big), big)
  expect_equal(downsize(big, small), big)
  test_mode()
  expect_equal(downsize(big), head(big))
  expect_equal(downsize(big, small), small)
  expect_equal(downsize(big, small), small)
  expect_silent(x <- downsize(1, rnorm(1e3), warn = F))

  expect_error(downsize(big, ncol = 0))
  expect_error(downsize(big, nrow = 0))
  expect_error(downsize(big, dim = c(0, 0)))

  expect_equal(downsize(big = 1:10, small = "small", length = 2), "small")
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
