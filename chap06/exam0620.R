library(nleqslv)
funs <- function(x) 
    c(x[1]^2 + x[2]^2 - 5, (x[1]+1)*x[2] - (3*x[1]+1)) 
xstart <- c(1, 1)
z <- nleqslv(x = xstart, fn = funs)
str(z, digits.d = 6)

jacobi<-function(x)
    matrix(c(2*x[1], 2*x[2], x[2] - 3, x[1] + 1), 
           nc = 2, nr = 2, byrow = TRUE)
z <- nleqslv(x = xstart, fn = funs, jac = jacobi, 
             method = "Newton", jacobian = TRUE)

