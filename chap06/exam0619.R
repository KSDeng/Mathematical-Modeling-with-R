f <- function(p, data)  sum((data-p)/(1+(data-p)^2))
x <- scan("exam0619.data")
uniroot(f, lower = 0, upper = 2, data = x)$root
