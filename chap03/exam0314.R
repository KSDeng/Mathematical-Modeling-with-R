## 投资问题
library(lpSolve)
c<-c(10, 8, 7, 6, 9)
A<-matrix(
   c(6, 4, 2,  4, 5, 
     1, 0, 1,  0, 1, 
     0, 1, 0,  1, 0, 
     0, 0, 1, -1, 0), nrow = 4, byrow = TRUE)
d<-c("<=", "==", ">=", "<="); b<-c(15, 1, 1, 0)
lp.sol<-lp (direction = "max", objective.in = c, 
    const.mat = A, const.dir = d, const.rhs = b, 
    all.bin = TRUE)
lp.sol
lp.sol$solution
