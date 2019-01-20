## 旧城改造问题
library(lpSolve)
c <-c(0.5, 0.95, 1.35, 1.7, 0)
z <- c(720, 1120,  1600,  2000, -850, 
         0,    0,     0,     0,    1,
      -0.8,  0.2,   0.2,   0.2,    0, 
       0.1, -0.9,   0.1,   0.1,    0,
      0.25, 0.25, -0.75, -0.75,    0,
        25,   35,    65,    80,    1)
A <- matrix(z, nc = 5, byrow = TRUE)
b <- c(0, 300, 0, 0, 0, 7500)
lp.sol <- lp(direction = "max", objective.in = c, 
    const.mat = A, const.dir = rep("<=", 6), 
    const.rhs = b, all.int = TRUE)
lp.sol
lp.sol$solution

