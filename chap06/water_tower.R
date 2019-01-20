library(pracma)
rt <- read.table("water_tower.data")
t <- rt$t; h <- rt$h; D <- 17.4
V <- pi/4*D^2*h #% 计算体积

t1 <- t[1:10]; t2 <- t[13:23]; t3 <- t[25:28] 
V1 <- V[1:10]; V2 <- V[13:23]; V3 <- V[25:28]
dV <- -c(gradient(V1, t1), gradient(V2, t2), gradient(V3, t3))

t <- c(t1, t2, t3); S <- splinefun(t, dV)
h <- 0.01; ti <- seq(min(t), max(t), by = h)
par(mai = c(0.9, 0.9, 0.1, 0.1))
plot(t, dV, pch=3, lwd=2, xlab = 'Time (h)', 
     ylab = 'Velocity (cubic meter / h)')
lines(ti, S(ti), col=4, lwd=2)

savePlot("amcm91a", type="eps")

#% 计算不同时刻24小时的用水量
Q <- numeric(6)
for(i in 1:6){
   ts <- (i-1)/3; te <- ts + 24   
   Q[i] <- quadl(S, ts, te)
}
Q

#% 计算相对误差
(max(Q)-min(Q))/mean(Q)

#% 计算实际用水量
T <- c(V[1]-V[10], V[13]-V[23], V[25]-V[28]); T
sum(T)

#% 计算模型用水量
t <- rt$t
Q <- c(quadl(S, t[1], t[10]), 
       quadl(S, t[13], t[23]), 
       quadl(S, t[25], t[28])
); Q 

#% 计算相对误差
abs(T-Q)

#% 计算相对误差
abs(T-Q)/T

#% 计算未知时刻的用水旦
Q <- c(quadl(S, t[10], t[13]), 
       quadl(S, t[23], t[25])
); Q 


