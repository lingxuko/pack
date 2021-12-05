# SolSyl package
Written by Lingxuan Kong  
This Package contains a function called Solvesylvester()  
This function can be used to solve standard sylvester equations like AX + XB = C, where A, B, C are all square matrices with same dimensions.     
Also, this function allows input matrices and real numbers, if real number is 0, it will degenerate to simple matrix equation.  
Input can be (Matrix, number, Matrix) or (number, Matrix, Matrix) or (Matrix, Matrix, Matrix), other input are not supported.  
This function is not fast because of not using Rcpp, sylvester() function from package "maotai" performs better.
 
 <!-- badges: start -->
 [![R-CMD-check](https://github.com/lingxuko/pack/workflows/R-CMD-check/badge.svg)](https://github.com/lingxuko/pack/actions)
 [![codecov](https://codecov.io/gh/lingxuko/pack/branch/main/graph/badge.svg?token=qFk0ArG3mI)](https://codecov.io/gh/lingxuko/pack)
 [![test-coverage](https://github.com/lingxuko/pack/actions/workflows/test-coverage.yaml/badge.svg)](https://github.com/lingxuko/pack/actions/workflows/test-coverage.yaml)
 <!-- badges: end -->
 
 
