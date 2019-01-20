library(lpSolve)
c <- c(2,5)
A <- matrix(c(1, 2, 1, 0, 0, 1), nrow=3, byrow=TRUE)
d <- c("<=", "<=", "<="); b <- c(8, 4, 3)
lp.sol<-lp (direction = "max", objective.in = c, 
    const.mat = A, const.dir = d, const.rhs = b, 
    compute.sens = 1)

lp.sol$sens.coef.from
lp.sol$sens.coef.to

lp.sol$duals
lp.sol$duals.from
lp.sol$duals.to
