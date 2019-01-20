library(parallel)
library(truncnorm)
library(Rsolnp)

#### Çó½â
a <- c(1.25, 8.75, 0.5, 5.75, 3,  7.25)
b <- c(1.25, 0.75, 4.75, 5, 6.5,  7.75)
d <- c(3, 5, 4, 7, 6, 11)

obj<-function(z){
    w <- matrix(z[1:12], nr=2, byrow=TRUE)
    x <- z[13:14]; y <- z[15:16]
    s <- 0
    for(i in 1:2)
        for(j in 1:6)
            s <- s + w[i,j]*sqrt((x[i]-a[j])^2+(y[i]-b[j])^2)
    return(s)
}

g <- function(z){
    w <- matrix(z[1:12], nr=2, byrow=TRUE)
    apply(w, 2, sum)
}

h <- function(z){
    w <- matrix(z[1:12], nr=2, byrow=TRUE)
    x <- z[13:14]; y <- z[15:16]
    c(apply(w, 1, sum), x[1]-x[2], y[1]-y[2])
}

sol<-solnp(pars=c(d/2, d/2, mean(a)/2, 3*mean(a)/2, mean(b)/2, 3*mean(b)/2), 
          fun=obj, eqfun = g, eqB = d, ineqfun = h, 
          ineqLB = c(10, 10, -10, -10), 
          ineqUB = c(20, 20, 0, 0), 
          LB = c(rep(0, 12), 0.5, 0.5, 0.75, 0.75),  
          UB = c(d, d, 8.75, 8.75, 7.75, 7.75)) 

w <- matrix(sol$par[1:12], nr=2, byrow=TRUE)
x <- sol$par[13:14]; y <- sol$par[15:16]

print(w, digits=3)
print(c(x, y), digits=4)


##### »æÍ¼
par(mai=c(0.8, 0.8, 0.2, 0.1))
plot(a, b, cex=1.2, pch=21, col=2, lwd=2, xlab="X", ylab="Y")
text(a, b, adj=c(-1, 0.5))
points(x, y, pch=19, col=4)

for(i in 1:2)
    for (j in 1:6)
        if (abs(w[i,j])>1e-2)
            segments( x0 = x[i], y0 = y[i], x1 = a[j], y1 = b[j], 
                     col="blue", lwd=2)

savePlot("location", type="eps")


