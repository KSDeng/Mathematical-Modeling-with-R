## 单周期生产模型
library(lpSolve)
c <- c(150, 200, 100,  50)
b <- c(1000, 1000, 1000, 1000)
d <- c( 800,  750,  600,  500) 
z <- c(.3,  .3,  .25, .15,  
      .25, .35,  .3,  .1,
      .45, .5,   .4,  .22,
      .15, .15,  .1,  .05)
A <- matrix(z, nc = 4, byrow = TRUE)

lp.sol <- lp(direction = "max", 
    objective.in = c, 
    const.mat = rbind(A, diag(rep(1,4))), 
    const.dir = c(rep("<=", 4), rep(">=",4)), 
    const.rhs = c(b, d), 
    all.int = TRUE)
lp.sol

## 另一种模型
p <- c( 75, 100,  50,  40)
lp.sol <- lp(direction = "max", 
    objective.in = c(c, -p),  
    const.mat = rbind(
                cbind(A, matrix(0, nc=4, nr=4)), 
                cbind(diag(rep(1,4)), diag(rep(1,4)))
    ),        
    const.dir = c(rep("<=", 4), rep("=",4)), 
    const.rhs = c(b, d), 
    all.int = TRUE)
lp.sol
lp.sol$solution

