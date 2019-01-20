fn <- function(x){
    F <- c(10*(x[2]-x[1]^2), 1-x[1]); F %*% F
}
gr <- function(x){
    F <- c(10*(x[2]-x[1]^2), 1-x[1])
    J <- matrix(c(-20*x[1], 10, -1, 0), 2, 2, byrow=T)
    2*t(J) %*% F      
}
