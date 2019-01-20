A <- matrix(c(0.25, 0.10, 0.10, 0.20, 0.20, 0.10, 0.10, 0.10, 0.20), 
     nrow = 3, byrow = TRUE)
y <- c(245, 90, 175)
I <- diag(nrow = 3, ncol = 3)
x <- solve(I-A, y); x
X <- rbind(A[1,]*x, A[2,]*x, A[3,]*x); X
