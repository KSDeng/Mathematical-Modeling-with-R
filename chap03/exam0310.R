library(lpSolve)
c <- c(2, 2)
A <- matrix(c(1, -1, 1, 1), nrow = 2, byrow = TRUE)
d <- c("<=", "<="); b <- c(-1, -1)
lp.sol<-lp (direction = "max", objective.in = c, 
    const.mat = A, const.dir = d, const.rhs = b)
lp.sol


