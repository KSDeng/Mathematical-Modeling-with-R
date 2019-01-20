library(lpSolve)
c <- rep(1, 6)
b <- c(4, 8, 10, 7, 12, 4)
A <- matrix(0, nr = 6, nc =6)
A[1, 1] <- 1; A[1, 6] <- 1 
for (i in 2:6){
    A[i, i-1] <- 1; A[i, i] <- 1 
}

lp.sol<-lp(objective.in = c, const.mat = A, 
    const.dir = rep(">=", 6), const.rhs = b)

names(lp.sol$solution) <- c(
    "0:01", "4:01", "8:01", "12:01", "16:01", "20:01")

lp.sol
lp.sol$solution

