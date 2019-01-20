library(pracma)
x <- y <- seq(from = -2, to = 2, by = 0.2)
m <- meshgrid(x, y); X <- m$X; Y <- m$Y
Z <- X * exp(-X^2 - Y^2)
g <- gradient(Z, x, y)
Fx <- g$X; Fy <- g$Y
par(mai=c(0.8, 0.8, 0.1, 0.1))
contour(x, y, t(Z), levels=seq(-0.5, 0.5, 0.1), 
        xlab = "X", ylab = "Y")
quiver(X, Y, Fx, Fy, scale = 0.2, col="blue")

savePlot("grad_plot", type="eps")


