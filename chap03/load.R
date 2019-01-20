library(lpSolve)
t <- c(48.7, 52.0, 61.3, 72.0, 48.7, 52.0, 64.0)
w <- c(2000, 3000, 1000, 500, 4000, 2000, 1000)
n <- c(8, 7, 9, 6, 6, 4, 8)

I <- diag(1, nrow = 7)
z <- rep(0, 7)
A <- matrix(c(t, z, z, t, w, z, z, w, 
              z[1:4], t[5:7], z[1:4], t[5:7]), 
     nc =14, byrow = T)

lp.sol <- lp(direction = "max", objective.in = c(t,t), 
      const.mat = rbind(cbind(I,I), A),
      const.dir = rep("<=", 12), 
      const.rhs = c(n, 1020, 1020, 40000, 40000, 302.7), 
      all.int = T
)
x<-lp.sol$solution
names(x)<-c("11", "12", "13", "14", "15", "16", "17", 
            "21", "22", "23", "24", "25", "26", "27")
lp.sol
x

