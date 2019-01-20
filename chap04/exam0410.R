source("Rosenbrock2.R")
nlminb(c(-1.2,1), fn, gr, lower=c(-2,-2), upper=c(2,2))
