library(lpSolve)
a <- c(14, 15, 15, 13); b <- c(10, 14, 20,  8)
z <- c(5,  6,  7,  8,
           5,  6,  7,
               6,  7,
                   6)
c <- matrix(99, nc=4, nr=4); k <- 0
for (i in 1:4)
    for (j in i:4)
        c[i,j] <- z[k<-k+1]

trans.sol <- lp.transport(cost.mat = c, 
     row.signs = rep("<=", 4), row.rhs = a, 
     col.signs = rep("=", 4), col.rhs = b)
trans.sol
trans.sol$solution

