library(pracma)
f <- function(x) 
    x[1]^3 + x[2]^2 + x[3]^2 +12*x[1]*x[2] + 2*x[3]
x0 <- c(1,1,1)
grad(f, x0)
