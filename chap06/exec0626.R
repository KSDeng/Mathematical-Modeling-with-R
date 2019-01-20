f <- function(x) x / (1 + x^2)
g <- function(x)  3 / (1 + x^2)
h <- function(x) (6*x - 3) / (1 + x^2)
x <- c(0, 1); y <- c(1, 2)
sol <- bvp(f, g, h, x, y,  n = 10)

plot(sol$xs, sol$ys, type="l")