test_that("compare matrices",{
  x <- SolveSylvester(matrix(c(1,0,-1,2,1,0,0,0,-1),3,3,byrow = TRUE),
                      matrix(c(2,1,0,0),2,2,byrow = TRUE),
                      matrix(c(2,2,1,1,1,1),3,2))
  y <- matrix(c(1,0,1,0,1,0),3,2)
  expect_equal(as.vector(x), as.vector(y), tolerance=1e-10)})


test_that("compare matrices",{
  x <- SolveSylvester(matrix(c(1,0,0,0,1,0,0,0,1),3,3,byrow = TRUE),
                      matrix(c(1,0,0,0,1,0,0,0,1),3,3,byrow = TRUE),
                      matrix(c(1,1,1,1,1,1,1,1,1),3,3))
  y <- matrix(c(0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5),3,3)
  expect_equal(as.vector(x), as.vector(y), tolerance=1e-10)})
