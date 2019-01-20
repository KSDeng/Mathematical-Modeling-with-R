library(pracma)
Ffun <- function(x){
    f <- numeric(10)
    for(i in 1:10)
        f[i] <- 2 + 2*i - exp(i*x[1]) - exp(i*x[2])
    f
}
gaussNewton(x0=c(0.3, 0.4), Ffun)

sol <- lsqnonlin(Ffun, x0 = c(0.3, 0.4))
str(sol, digits.d = 6)