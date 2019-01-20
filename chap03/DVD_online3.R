library(lpSolve)

########## 第(1)部分 ####################
rc <- read.csv("B2005Table2.csv")
A <- as.matrix(rc[2:1001,2:101])
m <- dim(A)[1]; n <- dim(A)[2]; s <- numeric(n)
for (j in 1:n)
    for (i in 1:m)
        if (A[i,j]>0) s[j] <- s[j] + 1
x <- 3*m/sum(s)*qbinom(0.95, size = m, prob = s/m)
d <- floor(x+0.5)
sum(d)

########## 第(2)部分 ####################
for (i in 1:m){
    for (j in 1:n){
        if (A[i,j]>0) A[i,j] <- 11 - A[i,j]
    }
}

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

########## 第(3)部分 ####################
R <- sample(c(0,1), size = m, replace = TRUE, prob = c(0.4, 0.6))
for (i in 1:m){
    if(R[i]==1) d[B[i,]] <- d[B[i,]] + 1
}

k <- 1; tol <- 0
B <- matrix(0, nr = m, nc = 3)

for (k in 1:3){
    lp.sol <- lp.transport (cost.mat = A, direction = "max", 
         row.signs = rep("<=", m), row.rhs = R, 
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







