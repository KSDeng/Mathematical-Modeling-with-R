rt<-read.table("exam0201.data")
lm.sol<-lm(Y ~ 1+X1+X2, data=rt)

summary(lm.sol)
confint(lm.sol)