cement<-read.table("exam0207.data")
lm.sol<-lm(Y ~ X1+X2+X3+X4, data=cement)
summary(lm.sol)

lm.step<-step(lm.sol)
summary(lm.step)
step(lm.sol, trace=0, k=3)

lm0<-lm(Y ~ 1, data = cement)
lm.ste<-step(lm0, scope = ~X1+X2+X3+X4, k=4)
