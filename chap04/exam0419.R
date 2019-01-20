library(quadprog)

rt <- read.table("exam0419.data")
D <- cov(rt); d <- rep(0,3)
m <- apply(rt, 2, mean)
A <- cbind(1, m, diag(rep(1,3)) )
b <- c(1, 1.15, rep(0,3) )

QP.sol <- solve.QP(Dmat = 2*D, dvec = d, 
    Amat = A, bvec = b, meq=1)
QP.sol
