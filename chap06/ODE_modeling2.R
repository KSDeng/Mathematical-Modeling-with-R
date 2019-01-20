library(pracma)
rt<-read.table("oil_shale.data")

tau <- function(t, theta)
    if (t<theta) 0 else 1


obj <- function(theta, data, a, b, n){
    odefun <- function(t, y) 
        c(-(theta[1]+theta[4])*y[1]*tau(t, theta[5]),
          (theta[1]*y[1] - (theta[2]+theta[3])*y[2])*tau(t, theta[5]),
          (theta[4]*y[1] + theta[2]*y[2])*tau(t, theta[5])
        )

    sol <- rk4sys(odefun, a = a, b = b, y0 = c(100, 0, 0), n = n)

    k <- 1; m <- length(rt$t)
    z <- matrix(0, nr=m, nc=2)
    for(i in 1:(n+1)){
        if (abs(sol$x[i]-data[k,1]) < 1e-5){
            z[k, ] <- sol$y[i,2:3]; k <- k+1
        }
    }
    sum((z[,1]-data[,2])^2)+sum((z[,2]-data[,3])^2)
}

nlm.sol <- nlm(f = obj, p = c(rep(1e-2, 4), 5), 
    data = rt, a = 0, b = 150, n = 150)
nlm.sol

##求解微分方程得到拟合值
odefun <- function(t, y) 
    c(-(theta[1]+theta[4])*y[1]*tau(t, theta[5]),
      (theta[1]*y[1] - (theta[2]+theta[3])*y[2])*tau(t, theta[5]),
      (theta[4]*y[1] + theta[2]*y[2])*tau(t, theta[5])
    )
theta <- nlm.sol$estimate
sol <- rk4sys(odefun, a = 0, b = 150, y0 = c(100, 0, 0), n = 150)

##绘图
par(mai=c(0.9, 0.9, 0.1,0.1))
plot(rt$t, rt$oil, ylim=c(0, 60), pch=15, cex=1.0, col="red",
     xlab="时间 (min)", ylab="浓度 (%)")
lines(sol$x, sol$y[,3], lwd=2, col="darkred")
points(rt$t, rt$bitumen, pch=18, cex=1.3, col="blue")
lines(sol$x, sol$y[,2], lwd=2, col="darkblue", lty=5)
legend(5,60, legend=c("油的原始数据", "沥青的原始数据",
                      "油的拟合曲线", "沥青的拟合曲线"), 
       pch=c(15, 18, -1, -1), lty=c(-1, -1, 1, 5), lwd=2, 
       col=c("red", "blue", "darkred", "darkblue") )


