f <- function(x) x^3 - x - 1
str(uniroot(f, c(1,2)), digits.d = 6)
