library(MASS)
lm.rid<-lm.ridge(y~1+x1+x2+x3, data=france, 
         lambda=seq(0, 0.2, length=50))
par(mai=c(0.9, 0.9, 0.2, 0.2))
plot(lm.rid)
