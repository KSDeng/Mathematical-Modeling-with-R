library(lpSolve)
c <- c(250, 225, 275, 240, 260, 250, rep(40, 6))
b <- c(100, 250, 190, 140, 220, 110)
A <- matrix(0, nr = 6, nc =12)
for (i in 1:6){
    A[i, i] <- 1; A[i, i+6] <- -1
    if (i <=5)
        A[i+1, i+6] <- 1
}
lp.sol<-lp(objective.in = c, const.mat = A, 
    const.dir = rep("=", 6), const.rhs = b)
lp.sol
lp.sol$solution

