test_that("compare matrices",{
  x <- SolveSylvester(matrix(c(1,0,-1,2,1,0,0,0,-1),3,3,byrow = TRUE),
                      matrix(c(2,1,0,0),2,2,byrow = TRUE),
                      matrix(c(2,2,1,1,1,1),3,2))
  y <- matrix(c(1,0,1,0,1,0),3,2)
  expect_equal(as.vector(x), as.vector(y), tolerance=1e-10)})

test_that("compare matrices",{
  x <- SolveSylvester(matrix(c(1,0,0,1),2,2,byrow = TRUE),
                      matrix(c(1,0,0,0,1,0,0,0,1),3,3,byrow = TRUE),
                      matrix(c(1,1,1,1,1,1),2,3))
  y <- matrix(c(0.5,0.5,0.5,0.5,0.5,0.5),3,2)
  expect_equal(as.vector(x), as.vector(y), tolerance=1e-10)})


test_that("compare matrices",{
  x <- SolveSylvester(matrix(c(1,0,0,0,1,0,0,0,1),3,3,byrow = TRUE),
                      matrix(c(1,0,0,0,1,0,0,0,1),3,3,byrow = TRUE),
                      matrix(c(1,1,1,1,1,1,1,1,1),3,3))
  y <- matrix(c(0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5),3,3)
  expect_equal(as.vector(x), as.vector(y), tolerance=1e-10)})

test_that("compare matrices",{
  x <- SolveSylvester(matrix(c(1,0,0,1),2,2,byrow = TRUE),
                      2,
                      matrix(c(1,0,0,1),2,2))
  y <- matrix(c(1/3,0,0,1/3),2,2,byrow = TRUE)
  expect_equal(as.vector(x), as.vector(y), tolerance=1e-10)})


test_that("compare matrices",{
  x <- SolveSylvester(matrix(c(1,0,0,1),2,2,byrow = TRUE),
                      0,
                      matrix(c(1,0,0,1),2,2))
  y <- matrix(c(1,0,0,1),2,2,byrow = TRUE)
  expect_equal(as.vector(x), as.vector(y), tolerance=1e-10)})



test_that("compare matrices",{
  x <- SolveSylvester(2,
                      matrix(c(1,0,0,1),2,2,byrow = TRUE),
                      matrix(c(1,0,0,1),2,2))
  y <- matrix(c(1/3,0,0,1/3),2,2,byrow = TRUE)
  expect_equal(as.vector(x), as.vector(y), tolerance=1e-10)})

test_that("compare matrices",{
  x <- SolveSylvester(0,
                      matrix(c(1,0,0,1),2,2,byrow = TRUE),
                      matrix(c(1,0,0,1),2,2))
  y <- matrix(c(1,0,0,1),2,2,byrow = TRUE)
  expect_equal(as.vector(x), as.vector(y), tolerance=1e-10)})


test_that("compare matrices",{
  x <- SolveSylvester(matrix(c(-1,0,0,-1),2,2,byrow = TRUE),
                      matrix(c(1,0,0,1),2,2,byrow = TRUE),
                      matrix(c(1,0,0,1),2,2))
  y <- "No unique solution"
  expect_equal(as.vector(x), as.vector(y), tolerance=1e-10)})

test_that("compare matrices",{
  x <- SolveSylvester(matrix(rnorm(100),10,10,byrow = TRUE),
                      matrix(c(1,0,0,1),2,2,byrow = TRUE),
                      matrix(c(1,0,0,1),2,2))
  y <- "Wrong Matrix Dimension"
  expect_equal(as.vector(x), as.vector(y), tolerance=1e-10)})

test_that("compare matrices",{
  x <- SolveSylvester(matrix(c(0,0,0,0),2,2,byrow = TRUE),
                      0,
                      matrix(c(1,0,0,1),2,2))
  y <- "No inverse Matrix, No solution"
  expect_equal(as.vector(x), as.vector(y), tolerance=1e-10)})

test_that("compare matrices",{
  x <- SolveSylvester(0,
                      matrix(c(0,0,0,0),2,2,byrow = TRUE),
                      matrix(c(1,0,0,1),2,2))
  y <- "No inverse Matrix, No solution"
  expect_equal(as.vector(x), as.vector(y), tolerance=1e-10)})

test_that("compare matrices",{
  x <- SolveSylvester(matrix(c(1,0,0,1),2,2,byrow = TRUE),
                      -1,
                      matrix(c(1,0,0,1),2,2))
  y <- "No inverse Matrix, No solution"
  expect_equal(as.vector(x), as.vector(y), tolerance=1e-10)})

test_that("compare matrices",{
  x <- SolveSylvester(-1,
                      matrix(c(1,0,0,1),2,2,byrow = TRUE),
                      matrix(c(1,0,0,1),2,2))
  y <- "No inverse Matrix, No solution"
  expect_equal(as.vector(x), as.vector(y), tolerance=1e-10)})



test_that("compare matrices",{
  x <- SolveSylvester("AAAAAA",
                      matrix(c(1,0,0,1),2,2,byrow = TRUE),
                      matrix(c(1,0,0,1),2,2))
  y <- "Wrong Input (Matrices and numbers ONLY)"
  expect_equal(as.vector(x), as.vector(y), tolerance=1e-10)})



