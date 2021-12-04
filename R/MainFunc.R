
#'SolveSylvester
#'
#' Function used to solve Sylvester equation AX + XB = C
#'
#'
#' @param A A square Matrix,
#' @param B A square Matrix.
#' @param C right hand side Matrix.
#' @import Matrix
#'
#' @return A solve of \code{A} \code{B} \code{C}
#'
#' @examples
#' SolveSylvester(matrix(c(1,0,-1,2,1,0,0,0,-1),3,3,byrow = TRUE),
#' matrix(c(2,1,0,0),2,2,byrow = TRUE),
#' matrix(c(2,2,1,1,1,1),3,2))
#'
#' @export

#Main function
SolveSylvester <- function(A,B,C){
  if((is.matrix(A))&(is.matrix(B))&(is.matrix(C))){
    ev_A <- eigen(A)$val
    ev_B <- eigen(-B)$val
    #Equation has a unique solution
    if(length(unique(c(ev_A,ev_B)))==(length(unique(ev_A))+length(unique(ev_B)))){
      if((nrow(A)==ncol(A))&(nrow(B)==ncol(B))&(nrow(C)==ncol(C))&(nrow(A)==nrow(B))&(nrow(B)==nrow(C))){
        n <- nrow(A)
        I <- diag(n)
        I_x_A <- kronecker(I,A)
        B_t_x_I <- kronecker(t(B),I)
        M <- I_x_A + B_t_x_I
        MtC <- crossprod(M,as(C,"vector"))
        MtM <- crossprod(M)
        R <- chol(MtM)
        z <- forwardsolve(R,MtC,upper.tri=TRUE,transpose=TRUE)
        Xest <- backsolve(R,z)
        Xest <- Matrix::Matrix(as.vector(Xest),n,n)
        Xest <- as.matrix(Xest)
        return(Xest)
      }else if((nrow(A)==ncol(A))&(nrow(B)==ncol(B))&(nrow(A)==nrow(C))&(ncol(B)==ncol(C))&(abs(nrow(A)-nrow(B))==1)){
        if(nrow(A)<nrow(B)){
          #A is a smaller Matrix, A and B only have 1 unit difference in dimension
          A <- cbind(A,0)
          A <- rbind(A,0)
          C <- rbind(C,0)
          n <- nrow(A)
          I <- diag(n)
          I_x_A <- kronecker(I,A)
          B_t_x_I <- kronecker(t(B),I)
          M <- I_x_A + B_t_x_I
          MtC <- crossprod(M,as(C,"vector"))
          MtM <- crossprod(M)
          R <- chol(MtM)
          z <- forwardsolve(R,MtC,upper.tri=TRUE,transpose=TRUE)
          Xest <- backsolve(R,z)
          Xest <- Matrix::Matrix(as.vector(Xest),n,n)
          Xest <- as.matrix(Xest)
          return(Xest[1:(n-1),])
        }
        if(nrow(B)<nrow(A)){
          #B is a smaller Matrix, A and B only have 1 unit difference in dimension
          B <- cbind(B,0)
          B <- rbind(B,0)
          C <- cbind(C,0)
          n = nrow(A)
          I = diag(n)
          I_x_A = kronecker(I,A)
          B_t_x_I = kronecker(t(B),I)
          M = I_x_A + B_t_x_I
          MtC = crossprod(M,as(C,"vector"))
          MtM = crossprod(M)
          R = chol(MtM)
          z <- forwardsolve(R,MtC,upper.tri=TRUE,transpose=TRUE)
          Xest <- backsolve(R,z)
          Xest <- Matrix::Matrix(as.vector(Xest),n,n)
          Xest <- as.matrix(Xest)
          return(Xest[,1:(n-1)])
        }
      }
      else{
        return("Wrong Matrix Dimension")
      }
    }else{
      return(c("No unique solution"))
    }
  }
  else if((is.matrix(A))&(is.matrix(C))&(is.numeric(B))&(length(B)==1)){
    if((nrow(A)==ncol(A))&(nrow(C)==ncol(C))&(nrow(A)==nrow(C))){
      if(B==0){#AX = C
        if(det(A)==0){
          return("No inverse Matrix, No solution")
        }else{
          X <- solve(A,C)
          return(X)}
      }else{#XB = BX if B is diagnal
        D <- A+diag(x=B,nrow(A),nrow(A))
        if(det(D)==0){
          return("No inverse Matrix, No solution")
        }else{
          X <- solve(D,C)
          return(X)}
      }
    }
  }else if((is.matrix(B))&(is.matrix(C))&(is.numeric(A))&(length(A)==1)){
    if((nrow(B)==ncol(B))&(nrow(C)==ncol(C))&(nrow(B)==nrow(C))){
      if(A==0){#XB = C
        if(det(B)==0){
          return("No inverse Matrix, No solution")
        }else{
          X <- C%*%solve(B)
          return(X)}
      }else{#XA = AX if B is diagnal
        D <- B+diag(x=A,nrow(B),nrow(B))
        if(det(D)==0){
          return("No inverse Matrix, No solution")
        }else{
          X <- C%*%solve(D)
          return(X)}
      }
    }
  }else{
    return("Wrong Input (Matrices and numbers ONLY)")
  }
}

