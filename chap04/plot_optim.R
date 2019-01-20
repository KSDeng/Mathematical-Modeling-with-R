pi <- 3.14; P <- 15000; S <- 76; E <- 2*10^6
rho <- 0.0083; t <- 0.25;  sigma_y <- 4200
d <- seq(from=2, to=12, by=0.5)
h <- seq(from=10, to=150, by=5)

f<-function(d,h) 2*rho*pi*t* d * sqrt(S^2+h^2)
g1 <- function(d,h) P/(pi*t)*sqrt(S^2+h^2)/(h*d)-sigma_y 
g2 <- function(d,h) 
    P/(pi*t)*sqrt(S^2+h^2)/(h*d)-(pi^2*E*(d^2+t^2))/8/(S^2+h^2) 

par(mai=c(.9, .8, 0.3, 0.1))
w<-outer(d, h, f)
contour(d,h,w, 
    levels = c(2.5, 4, 5.5, 7, 9, 11, 13.5, 17, 20, 23.5), 
    col="blue", lwd=2,  xlab = "d", ylab ="H", lty=5) 
C1<-outer(d, h, g1)
contour(d,h,C1, levels = 0, drawlabels = F, add=T, col="brown", lwd=2) 
C2<-outer(d, h, g2)
contour(d,h,C2, levels = 0, drawlabels = F, add=T, col="brown", lwd=2) 
points(6.4, 76, pch=19, cex=1.2, col="red")

savePlot("optim", type="eps")

