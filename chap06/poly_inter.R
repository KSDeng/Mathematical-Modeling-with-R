poly_inter <- function(x, y, xout){
    n <- length(x); yout <- y[1]; p <-1
    for(k in 1:(n-1)){
        for(i in n:(k+1)){
            y[i] <- (y[i] - y[i-1])/(x[i] - x[i-k])
        }
        p <- p * (xout - x[k])
        yout <- yout + y[k+1] * p 
    }
    yout 
}
