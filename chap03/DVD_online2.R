library(lpSolve)
rc <- read.csv("B2005Table2.csv")
A <- as.matrix(rc[2:1001,2:101])
m <- dim(A)[1]; n <- dim(A)[2]
for (i in 1:m){
    for (j in 1:n){
        if (A[i,j]>0) A[i,j] <- 11 - A[i,j]
    }
}
d <- as.vector(rc[1,2:101])
k <- 1; tol <- 0
B <- matrix(0, nr = m, nc = 3)

for (k in 1:3){
    lp.sol <- lp.transport (cost.mat = A, direction = "max", 
         row.signs = rep("<=", m), row.rhs = rep(1, m), 
         col.signs = rep("<=", n), col.rhs = d)
    tol <- tol + lp.sol$objval

    x<-lp.sol$solution
    for (i in 1:m)
        for (j in 1:n)
            if (x[i,j] == 1){
                B[i,k]<-j; A[i,j]<-0
            }
    d <- d - apply(x, 2, sum)
}
tol 

