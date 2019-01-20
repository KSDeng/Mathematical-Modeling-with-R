odef <- function(t,y)
    c(y[2]+y[1]*(1-y[1]^2-y[2]^2), -y[1]+y[2]*(1-y[1]^2-y[2]^2))

y0<- c(2, 2)
y0<- c(0.02, 0.02)
sol <- ode45(odef, t0 = 0, tfinal = 4*pi, y0 = y0)

par(mai=c(0.9,0.9,0.1,0.1))
plot(sol$y[,1], sol$y[,2], type="l", 
     xlab=expression(y[1]), ylab=expression(y[2]), 
     cex.lab=1.3)