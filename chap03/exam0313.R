## 职员安排问题
library(lpSolve)
c <- rep(1, 7)
A <- matrix (1, nrow=7, ncol=7)
for (i in 1:7){
   A[i, i%%7+1] <- 0; A[i,(i+1)%%7+1] <- 0
}
d <- rep(">=", 7)
b <- c(18, 15, 12, 16, 19, 14, 12)
lp.sol<-lp (objective.in = c, const.mat = A, 
    const.dir = d, const.rhs = b, all.int = TRUE)
lp.sol
lp.sol$solution

