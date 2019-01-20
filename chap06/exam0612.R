library(pracma)
f <- function(x, y) sqrt(abs(y - x^2))
Q <- dblquad(f, -1, 1, 0, 2); Q
abs(5/3+pi/2-Q)