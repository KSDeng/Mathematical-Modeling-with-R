f <- function(t) exp(-(t/(1-t))^2) / (1-t)^2
integrate(f, 0, 1)