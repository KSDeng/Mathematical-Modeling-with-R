library(pracma)
Ffun <- function(x)
    c(10*(x[2]-x[1]^2), 1-x[1], 
      sqrt(90)*(x[4]-x[3]^2), 1-x[3], 
      sqrt(10)*(x[2]+x[4]-2), 1/sqrt(10)*(x[2]-x[4])
)
gaussNewton(x0 = c(-3, -1, -3, -1), Ffun)

lsqnonlin(Ffun, x0 = c(-3, -1, -3, -1))