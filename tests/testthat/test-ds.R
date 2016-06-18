# library(testthat); library(downsize)
context("downsize")

objs = function(n = 1e2){
  list(
    1,
    1:5,
    1:n,
    array(0, dim = 1:4),
    array(0, dim = c(10, 2, n, n, 4)),
    matrix(0, nrow = 4, ncol = 4),
    matrix(0, nrow = 4, ncol = n),
    matrix(0, nrow = n, ncol = 4),
    matrix(0, nrow = n, ncol = n),
    as.data.frame(matrix(0, nrow = 4, ncol = 4)),
    as.data.frame(matrix(0, nrow = 4, ncol = n)),
    as.data.frame(matrix(0, nrow = n, ncol = 4)),
    as.data.frame(matrix(0, nrow = n, ncol = n))
  )
}

bigs = objs()
smalls = objs(getOption("downsize.length"))

test_that("Function ds runs correctly", {
  expect_error(ds())
  expect_equal("jim", ds("jim", "bob"))
  expect_equal(c("jim", "bob"), ds(c("jim", "bob"), length = 1))
  a = matrix(1:100, ncol = 10)
  expect_equal(a, ds(a, ncol = 2))
  expect_equal(a, ds(a, nrow = 2))
  for(o in bigs) expect_equal(o, ds(o))
  options(downsize = TRUE)
  expect_equal("bob", ds("jim", "bob"))
  expect_equal("jim", ds(c("jim", "bob"), length = 1))
  expect_equal(a[,1:2], ds(a, ncol = 2))
  expect_equal(a[1:2,], ds(a, nrow = 2))
  for(i in 1:length(bigs)) expect_equal(smalls[[i]], ds(bigs[[i]]))
})
