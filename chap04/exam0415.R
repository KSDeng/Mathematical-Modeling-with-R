library(parallel)
library(truncnorm)
library(Rsolnp)

P <- 15000; S <- 76; E <- 2*10^6
rho <- 0.0083; t <- 0.25;  sigma_y <- 4200

obj <- function(x){
    d<-x[1]; h<-x[2]
    2*rho*pi*t* d * sqrt(S^2+h^2)
}
const <- function(x){
    d<-x[1]; h<-x[2]
    z1 <- P/(pi*t)*sqrt(S^2+h^2)/(h*d)-sigma_y 
    z2 <- P/(pi*t)*sqrt(S^2+h^2)/(h*d)-(pi^2*E*(d^2+t^2))/8/(S^2+h^2)
    c(z1, z2)
}

nlp.sol <- solnp(pars=c(6,50), fun = obj, ineqfun = const, 
      ineqLB = c(-1e4,-1e4), ineqUB = c(0,0))

nlp.sol$pars
nlp.sol$convergence
nlp.sol$elapsed