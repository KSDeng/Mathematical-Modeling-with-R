print_figure <- function(s1, s2, ts, x, y){
    par(mai=c(0.8, 0.8, 0.2, 0.1))
    plot(ts[[1]], ts[[2]], type = "l", col = "blue",  
    ylim = c(min(s1$y), max(s1$y)), lwd = 2, 
    xlab = "x", ylab = "y")
    lines(s1[[1]], s1[[2]], type = "o", lty = 4, 
          pch = 16, col = "red")
    lines(s2[[1]], s2[[2]], type = "o", lty = 5, 
          pch = 15, col = "red")
    legend(x, y, legend = c('True Curve', 
           'Euler Method', 'Crank-Nicolson Method '), 
           col = c('blue', 'red', 'red'), lwd = c(2, 1, 1),
           lty = c(1, 4, 5), pch = c(NA, 16, 15))
}

f <- function(x, y) -10*y
h <- 0.16; n <- 9
s1 <- euler_heun(f, a = 0, b = h*n, 1, n = n, im = F)
s2 <- cranknic(f, t0 = 0, t1 = h*n, y0 = 1, N = n+1)
x <- seq(0, 1.5, length.out = 51); y <- exp(-10*x)
s3 <- list(x = x, y = y)
print_figure(s1, s2, s3, 0.8, 1.0)
savePlot("ode_1", type="eps")

h <- 0.21; n <- 7
s1 <- euler_heun(f, a = 0, b = h*n, y0 = 1, n = n, im = F)
s2 <- cranknic(f, t0 = 0, t1 = h*n, y0 = 1, N = n+1)
print_figure(s1, s2, s3, 0, -1.4)
savePlot("ode_2", type="eps")

