## 习题21
f <- function(x,y) x*y^(1/3)
s1 <- euler_heun(f, a=1, b=2, y0=1, n = 10, improved = FALSE)
s2 <- euler_heun(f, a=1, b=2, y0=1, n = 10)

yy<-function(x) sqrt((x^2+2)^3/27)
abs(yy(2)-s1$y[11])
abs(yy(2)-s2$y[11])

xx<-seq(from = 1, to = 2, by = 0.1)
par(mai=c(0.9, 0.9, 0.1, 0.1))
plot(xx, yy(xx), type="l", lwd=2, col="blue", 
     xlab="x", ylab="y")
lines(s1$t, s1$y, lwd=2, lty=2, col="brown")
lines(s2$t, s2$y, lwd=2, lty=5, col="red")
legend(1, 2.8, legend=c("精确解", "Euler方法", "改进Euler方法"),
       lty = c(1,2,5), col=c("blue", "brown", "red"), lwd=2)

## 习题22
s3 <- rk4(f, a=1, b=2, y0=1, n = 10)
abs(yy(2)-s3$y[11])
lines(s3$x, s3$y, lwd=2, lty=4, col="green")
