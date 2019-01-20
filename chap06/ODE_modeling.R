library(pracma)
t <- c(1, 2, 3, 4, 6, 8, 10, 12, 16)
y <- c(0.7, 1.2, 1.4, 1.4, 1.1, 0.8, 0.6, 0.5, 0.3) 

nls.sol<-nls(y ~ theta[1]*theta[3]/(theta[1]-theta[2])*
                 (-exp(-theta[1]*t)+exp(-theta[2]*t)), 
    data=data.frame(t=t, y=y), 
    start=list(theta=c(0.1, 0.3, 7)))
summary(nls.sol)

obj <- function(theta, t, y, a, b, n){
    odefun <- function(t, y) 
        c(-theta[1]*y[1], theta[1]*y[1] - theta[2]*y[2]);

    sol <- rk4sys(odefun, a = a, b = b, 
                  y0 = c(theta[3], 0), n = n)
    k <- 1; m <- length(y)
    z <- numeric(m)
    for(i in 1:(n+1)){
        if (abs(sol$x[i]-t[k]) < 1e-5){
            z[k] <- sol$y[i,2]; k <- k+1
        }
    }
    sum((z-y)^2)
}

nlm.sol <- nlm(f = obj, p = c(0.1, 0.3, 7), 
    y = y, t = t, a = 0, b = 16, n = 160)
nlm.sol

