fn <- function(x)  -x[1]*x[2]*x[3]
gr <- function(x) c(-x[2]*x[3], -x[1]*x[3], -x[1]*x[2])
z <- c(1, 2, 2, -1, -2, -2, 1, 0, 0, 0, 1, 0, 0, 0, 1,
       -1, 0, 0, 0, -1, 0, 0, 0, -1)
A <- matrix(z, nc=3, byrow=T)
b <- c(0, -72, 0, 0, 0, -20, -11, -42)
constrOptim(rep(10, 3), fn, gr, ui=A, ci=b)
