france<-read.table("exam0205.data")
lm.sol<- lm(y~1+x1+x2+x3, data=france)
lm.sum<-summary(lm.sol)
coef(lm.sum)
