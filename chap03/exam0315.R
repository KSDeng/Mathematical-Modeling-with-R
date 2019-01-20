library(lpSolve)
c <- c(0.25, 0.21, 0.22, 16, 25, 18)
A <- rbind(
    c(1, 1, 1,    0,    0,    0), 
    c(1, 0, 0, -200,    0,    0), 
    c(0, 1, 0,    0, -200,    0), 
    c(0, 0, 1,    0,    0, -200)) 
d <- c("=", rep("<=", 3)); 
b <- c(200, rep(0, 3))
lp.sol <- lp(objective.in = c, const.mat = A, 
    const.dir = d, const.rhs = b, binary.vec = 4:6)
lp.sol
lp.sol$solution