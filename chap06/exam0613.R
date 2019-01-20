library(pracma)
f <- function(x, y) sqrt(pmax(0, 1 - (x^2 + y^2)))
f <- function(x, y) sqrt((1 - (x^2 + y^2)) * (x^2 + y^2 <= 1))
Q <- dblquad(f, -1, 1, -1, 1); Q
abs(2/3*pi-Q)
