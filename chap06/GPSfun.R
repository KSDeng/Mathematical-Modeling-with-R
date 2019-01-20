#% 非线性函数
GPS_F <- function(x, data){
    m <- nrow(data); f <- numeric(m); c <- 299792.458
    for(i in 1:m){
        f[i] <- - (c*(data[i,4]-x[4]))^2
        for(j in 1:3)
            f[i] <- f[i] + (x[j]-data[i,j])^2
    }
    f
}
#% Jacobi矩阵函数
GPS_J <- function(x, data){
    m <- nrow(data); J <- matrix(0, nr=m, nc=4)
    c <- 299792.458
    for(i in 1:m){
        J[i,] <- c(2*(x[1]-data[i,1]), 2*(x[2]-data[i,2]), 
                   2*(x[3]-data[i,3]), 2*c^2*(data[i,4]-x[4]) )
    }
    J
}
