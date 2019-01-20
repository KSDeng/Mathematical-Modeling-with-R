rt<-read.table("rainfall.dat"); rt

ap.sd<-apply(rt, 2, sd); ap.sd
sort(ap.sd)

op <- par(mfrow=c(2,2), mar=.5+c(4,4,1,1), oma=c(0,0,2,0))
####################################################
lm.12<-lm(X12~0+X8+X11, data=rt)
summary(lm.12)

year<-1981:1990
pr.12<-predict(lm.12)
plot(year, rt$X12, cex=1.4, pch=21, col=2, lwd=2, type="o",
     xlab="Year", ylab="Rainfall", 
      ylim=c(min(pr.12, rt$X12),max(pr.12, rt$X12)), 
      main="X12 ~ X8+X11")
points(year, pr.12, cex=1.4, pch=22, col=4)
lines(year, pr.12, lwd=2,col=4, lty=5)
legend(1986.5, max(pr.12, rt$X12)-3, 
       c("Real", "Predict"), col=c(2,4),  lty=c(1,5))

######################################################

lm.7<-lm(X7~0+X6+X3+X4+X8+X11+X10, data=rt)
summary(lm.7)
lm.7<-step(lm.7)

lm.7<-lm(X7~0+X3+X4, data=rt)
summary(lm.7)

pr.7<-predict(lm.7)
plot(year, rt$X7, cex=1.4, pch=21, col=2, lwd=2, type="o",
     xlab="Year", ylab="Rainfall", 
     ylim=c(min(pr.7, rt$X7),max(pr.7, rt$X7)), 
      main="X7 ~ X3+X4")
points(year, pr.7, cex=1.4, pch=22, col=4)
lines(year, pr.7, lwd=2,col=4, lty=5)
legend(1981.2, max(pr.7, rt$X7)-3, 
       c("Real", "Predict"), col=c(2,4),  lty=c(1,5))

###########################################################
lm.10<-lm(X10~0+X9+X11, data=rt)
summary(lm.10)

lm.10<-step(lm.10)
lm.10<-lm(X10~0+X11, data=rt)
summary(lm.10)

pr.10<-predict(lm.10)
plot(year, rt$X10, cex=1.4, pch=21, col=2, lwd=2, type="o",
     xlab="Year", ylab="Rainfall", 
      ylim=c(min(pr.10, rt$X10),max(pr.10, rt$X10)), 
      main="X10 ~ X11")
points(year, pr.10, cex=1.4, pch=22, col=4)
lines(year, pr.10, lwd=2,col=4, lty=5)
legend(1984, max(pr.10, rt$X10)-3, 
       c("Real", "Predict"), col=c(2,4),  lty=c(1,5))

###########################################################
lm.5<-lm(X5~0+X1+X6+X9, data=rt)
summary(lm.5)

lm.5<-step(lm.5)
lm.5<-lm(X5~0+X9, data=rt)
summary(lm.5)

pr.5<-predict(lm.5)
plot(year, rt$X5, cex=1.4, pch=21, col=2, lwd=2, type="o",
     xlab="Year", ylab="Rainfall", 
      ylim=c(min(pr.5, rt$X5),max(pr.5, rt$X5)), 
      main="X5 ~ X9")
points(year, pr.5, cex=1.4, pch=22, col=4)
lines(year, pr.5, lwd=2,col=4, lty=5)
legend(1986.5, max(pr.5, rt$X5)-3, 
       c("Real", "Predict"), col=c(2,4),  lty=c(1,5))

#########################################################
par(op)

savePlot("rainfall", type="eps")
