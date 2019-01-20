library(lpSolve)
c <- c(3, 9)
A <- matrix(c(1, 1, 0.21, -0.30, 0.03, -0.01), 
            nrow=3, byrow=TRUE)
d <- c(">=", "<=", ">="); b <- c(800, 0, 0)
lp.sol <- lp(objective.in = c, const.mat = A, 
    const.dir = d, const.rhs = b)
lp.sol
lp.sol$solution

## 目标函数求极大
lp.sol <- lp (direction = "max", objective.in = c, 
    const.mat = A, const.dir = d, const.rhs = b)
lp.sol

