library(lpSolve)
c <- rep(c(0, 250, 1000, 2000),  each = 4)
b <- c(400, 600, 400, 500, rep(0, 4))
A <- matrix(0, nr = 8, nc =16)
for (i in 1:4){
    A[i, i] <- 10; A[i, i+4] <- -1
    A[i+4, i] <- 1; A[i+4, i+8] <- -1; A[i+4, i+12] <- 1
    if (i <=3){
        A[i+1, i+4] <- 1; A[i+5, i] <- -1
    }
}

lp.sol<-lp(objective.in = c, const.mat = A, 
    const.dir = rep("=", 8), const.rhs = b)

names(lp.sol$solution)<-c(
    paste0("x", 3:6), paste0("I", 3:6),
    paste0("Smin", 3:6), paste0("Splu", 3:6))

lp.sol
lp.sol$solution


