X <- matrix(c(15, 20, 30, 30, 10, 45, 20, 60, 0), 
     nrow = 3, byrow =TRUE)
x <- c(100, 200, 150)
A <- rbind(X[1,]/x, X[2,]/x, X[3,]/x); A
I <- diag(nrow = 3, ncol = 3)
B <- solve(I - A) - I; B
y <- c(50, 150, 100); x <- solve(I - A, y); x
I + B


