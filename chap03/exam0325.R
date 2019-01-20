## 下料问题
library(lpSolve)
c <- c(3, 1, 3, 3, 1, 1, 3)
# c <- rep(1,7)
A <- matrix(
   c(4, 3, 2, 1, 1, 0, 0,
     0, 1, 0, 2, 1, 3, 0,
     0, 0, 1, 0, 1, 0, 2), 
   nrow=3, byrow=TRUE)
b <- c(50, 20, 15)
lp.sol <- lp(objective.in = c, const.mat = A, 
    const.dir = rep(">=", 3), const.rhs = b,
    all.int = TRUE) 
lp.sol
lp.sol$solution

c <- c(3, 1, 3, 3, 1, 1, 3)
c %*% lp.sol$solution
