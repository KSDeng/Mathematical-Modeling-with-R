lorenz <- function(t, x, beta, sigma, rho)
c(-beta*x[1]+x[2]*x[3], -sigma*x[2]+sigma*x[3],  -x[1]*x[2]+rho*x[2]-x[3])
 
sol <- ode45(lorenz, t0=0, tfinal = 100, y0 = c(0, 0, 1e-10), 
       beta = 8/3, sigma = 10, rho = 28)
x <- sol$y[,1]; y <- sol$y[,2]; z <- sol$y[,3]
scatterplot3d(y, z, x, type="l", angle = 45, 
    scale.y = 0.7, mar = c(2.5, 2.5, 0.5, 1.5), 
    xlab = expression(x[2]),  ylab = expression(x[3]), 
    zlab = expression(x[1]))
savePlot("lorenz", type="eps")