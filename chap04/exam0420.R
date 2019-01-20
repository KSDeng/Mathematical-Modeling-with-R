library(LowRankQP)

rt <- read.table("exam0419.data")
rt$D <- 1.05
D <- cov(rt); d <- rep(0, 4)
m <- apply(rt, 2, mean)
A <- cbind(1, m); b <- c(1, 1.15)

lr.sol <- LowRankQP(Vmat = D, dvec = d, Amat = t(A), 
    bvec = b, uvec = rep(1, 4), method = "CHOL")
y <- as.vector(lr.sol$alpha)
v <- y %*% D %*% y
print(c(y, v), digits=5)
