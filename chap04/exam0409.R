source("Rosenbrock2.R")
optim(c(-1.2, 1), fn, gr, method = "BFGS")
