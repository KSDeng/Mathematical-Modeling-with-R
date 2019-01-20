library(lpSolve)
cost<-matrix( c(6, 2, 6, 7,   4, 9, 5, 3,   8, 8, 1, 5), 
    nrow=3, byrow=TRUE)
capacity <- c(30, 25, 21)
demand <- c(15, 17, 22, 12) 
   
trans.sol <- lp.transport (cost.mat = cost, 
     row.signs = rep("<=", 3), row.rhs = capacity, 
     col.signs = rep("=", 4), col.rhs = demand) 

trans.sol
trans.sol$solution

