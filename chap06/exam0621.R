library(nleqslv)
fun <- function(x, m){
    a <- x[1]; b <- x[2]
    c(a + b - 2*m[1], a^2 + a*b + b^2 - 3*m[2])
}
z <- scan("exam0621.data")
nleqslv(x = c(1, 2), fn = fun, m = c(mean(z), mean(z^2)))

