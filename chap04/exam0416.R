obj <- function(x, data){
  F <- x[1] + x[2]* data$xi^x[3] - data$eta 
  sum(F^2)
}
rt <- read.table("exam0416.data")
nlm.sol <- nlm(f = obj, p = c(1, 20, 0), data=rt)
nlm.sol

F <- function(x, p)
  p[1] + p[2]* x^p[3] 

xi  <- seq(from = 0.5, to = 20.5, by = 0.5)
eta <- F(xi, nlm.sol$estimate)

par(mai = c(0.8, 0.8, 0.2, 0.1))
with(rt, plot(xi, eta, pch=19, cex=1.2, col="red"))
lines(xi, eta, lwd=2, col="blue")

savePlot("curve_fit", type="eps")


