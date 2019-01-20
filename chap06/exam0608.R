library(akima)
rt <- read.table("exam0608.data")
attach(rt)
inter <- interp(x, y, z,  
                xo = seq(min(x), max(x), length = 100),
                yo = seq(min(y), max(y), length = 100),
                linear = FALSE, extrap = TRUE)
par(mai = c(0.8, 0.8, 0.1, 0.1))  
contour(inter, levels = c(seq(-5.8, 0, 0.2)), 
        col = "blue", xlab = "X", ylab = "Y")
detach(rt)

savePlot("amcm86a", type="eps")
