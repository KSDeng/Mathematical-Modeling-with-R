## 奶制品加工问题
library(lpSolve)
c<-c(72, 64)
A<-matrix(c(1,1,12,8, 3, 0), nrow=3, byrow=TRUE)
d<-rep("<=", 3); b<-c(50, 480, 100)
lp.sol<-lp (direction = "max", objective.in = c, 
    const.mat = A, const.dir = d, const.rhs = b,
    compute.sens=1) 

##最优解
c(lp.sol$objval, lp.sol$solution)

##对偶及变化范围
rbind(lp.sol$duals, lp.sol$duals.from, lp.sol$duals.to)

##系数的变化范围
rbind(lp.sol$sens.coef.from, lp.sol$sens.coef.to)

