f <- function(t, y, mu) c(y[2], mu*(1-y[1]^2)*y[2]-y[1]);
sol <- ode23(f, t0=0, tf=40, y0=c(1,0), mu=5)

par(mai=c(0.9,0.9, 0.2, 0.1))
plot(c(0, 40), c(-6, 6), type = "n",
   xlab = "t", ylab = "y(t) & y'(t)")
lines(sol$t, sol$y[, 1], col = "blue", lwd=2)
lines(sol$t, sol$y[, 2], col = "red", lty=2, lwd=2)
grid()

savePlot("Verderpol", type="eps")