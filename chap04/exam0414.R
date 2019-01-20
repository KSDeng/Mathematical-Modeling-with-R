library(quadprog)

Q<-matrix(0, nc=4, nr=4); Q[1:2, 1:2]<-diag(c(1,-1))
A<-matrix(c(1, 2, -1, 0,  -5, 4,  0, 1), 
    nr = 2, byrow = TRUE)
b<-c(2, 10)

library(LowRankQP)
LowRankQP(Vmat = Q, dvec = rep(0,4), Amat = A, bvec = b, 
          uvec = c(3, 25/4, 15, 25), method = "CHOL")