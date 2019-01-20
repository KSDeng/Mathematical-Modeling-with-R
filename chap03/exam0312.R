## ����Ʒ�ӹ�����
library(lpSolve)
c<-c(72, 64)
A<-matrix(c(1,1,12,8, 3, 0), nrow=3, byrow=TRUE)
d<-rep("<=", 3); b<-c(50, 480, 100)
lp.sol<-lp (direction = "max", objective.in = c, 
    const.mat = A, const.dir = d, const.rhs = b,
    compute.sens=1) 

##���Ž�
c(lp.sol$objval, lp.sol$solution)

##��ż���仯��Χ
rbind(lp.sol$duals, lp.sol$duals.from, lp.sol$duals.to)

##ϵ���ı仯��Χ
rbind(lp.sol$sens.coef.from, lp.sol$sens.coef.to)
