library(akima)
x <- scan("exam0607.data", nlines = 1)
y <- scan("exam0607.data", skip = 1, nlines = 1)
z <- scan("exam0607.data", skip = 2)
Z <- matrix(z, nr = length(x), nc = length(y))
inter <- bicubic.grid(x, y, Z, xlim = c(0, 5600), 
            ylim = c(0, 4800), dx = 50, dy = 50)
par(mai = c(0.8, 0.8, 0.1, 0.1))  
contour(inter, levels = seq(100, 1600, 100), 
        col = "blue", xlab = "X", ylab = "Y")

savePlot("mcm94a", type="eps")


x0<-seq(0, 5600, 50); y0<-seq(0, 4800, 50)
X0<-rep(x0, length(y0)); Y0<-rep(y0, each = length(x0))
Z0<-matrix(bicubic(x, y, Z, X0, Y0)$z, 
           nr = length(x0), nc = length(y0))
par(mai = c(0.8, 0.8, 0.1, 0.1))  
contour(x0, y0, Z0,  levels = seq(100, 1600, 100), 
        col="blue", xlab="X", ylab="Y")

