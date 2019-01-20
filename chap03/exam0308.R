library(lpSolve)
c <- c(2,5)
A <- matrix(c(1, 2, 1, 0, 0, 1), nrow=3, byrow=TRUE)
d <- c("<=", "<=", "<="); b <- c(8, 4, 3)
lp.sol<-lp (direction = "max", objective.in = c, 
    const.mat = A, const.dir = d, const.rhs = b)
lp.sol
lp.sol$solution

## 矩阵按列输入
A <- matrix(c(1, 2, 1, 0, 0, 1), ncol=3)
lp.sol<-lp (direction = "max", objective.in = c, 
    const.mat = A, const.dir = d, const.rhs = b,
    transpose.constraints = FALSE)

## 矩阵按稀疏结构输入
A <- matrix(c(1,1,1, 1,2,2, 2,1,1, 3,2,1), 
    nrow=4, byrow=TRUE)
lp.sol<-lp (direction = "max", objective.in = c,
    const.dir = d, const.rhs = b, dense.const = A)


