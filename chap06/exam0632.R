f <- function(x) 2*x / (1 + x^2)
g <- function(x)  -2 / (1 + x^2)
h <- function(x) rep(1, length(x))
x <- c(0.0, 4.0); y <- c(1.25, -0.95)
sol <- bvp(f, g, h, x, y,  n = 100)

sfun <- function(x) 
    1.25 + (169/20 - 2*atan(4) -15*log(17)/8)*x - 
    2.25*x^2 + 2*x*atan(x) - 1/2 * log(1+x^2) + 
    1/2 * x^2 * log(1+x^2)

max(abs(sfun(sol$xs)-sol$ys))