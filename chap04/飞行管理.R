library(parallel)
library(truncnorm)
library(Rsolnp)

##%% 初始数据
pi <- 3.1415926;
x <- c(0, 150, 85, 150, 145, 130)
y <- c(0, 140, 85, 155,  50, 150)
theta <- c(52, 243, 236, 220.5, 159, 230)

##%% 两架飞机的达到最近时的参数及距离
minpoint <- function(theta){
   l <- matrix(0, nr=5, nc=5)
   d <- matrix(0, nr=5, nc=5)
   c <- cos(theta*pi/180)
   s <- sin(theta*pi/180)
   for(i in 1:5){
      for(j in (i+1):6){
         z <- (x[i]-x[j])*(c[i]-c[j]) +
              (y[i]-y[j])*(s[i]-s[j])
         z <- -z/((c[i]-c[j])^2+(s[i]-s[j])^2)
         l[i,j-1] <- z
         d[i,j-1] <- (x[i]-x[j]+z*(c[i] - c[j]))^2 +
                     (y[i]-y[j]+z*(s[i] - s[j]))^2
       }
   }
   dimnames(l)<-list(1:5, 2:6)
   dimnames(d)<-list(1:5, 2:6)
   list(parameter = l, distance = sqrt(d))
}
minpoint(theta)

##%% 找出不满足条件的点作为约束的条件
l <- c(108.392059,  99.20688)

##%% 目标函数
obj <- function(delta) sum(delta[1:6]^2)

##%% 约束条件
r <- length(l)
const <- function(delta){
   theta <- theta + delta
   h <- numeric(0); m <- 1
   c <- cos(theta*pi/180)
   s <- sin(theta*pi/180)
   for( i in 1:5)
      for (j in (i+1):6)
         for (k in 1:r){
            h[m] <- (x[i]-x[j]+l[k]*(c[i] - c[j]))^2 +
                    (y[i]-y[j]+l[k]*(s[i] - s[j]))^2
            m <- m + 1
         }
   h
}

##%% 求最优解
nlp.sol <- solnp(pars = rep(0,6), fun = obj, 
    ineqfun = const, ineqLB = rep(64.1, 15*r), 
    ineqUB = rep(Inf, 15*r), 
    LB = -rep(30, 6), UB = rep(30, 6))

##%% 输出结果
print(nlp.sol$par, digits = 4)

##%% 计算调整后的度数是否满足条件
delta<-nlp.sol$par
minpoint(theta+delta)

##%% 增加参数重新计算
l <- c(108.392059, 99.20688, 96.44293)

