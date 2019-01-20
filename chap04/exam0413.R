library(quadprog)

D <- diag(c(2, 2))
d <- c(2, 5)
A <- matrix(c(1, -2, -1, -2, -1, 2, 1, 0, 0, 1), nc =5)
b <- c(-2, -6, -2, 0, 0)
solve.QP(Dmat = D, dvec = d, Amat = A, bvec = b)

