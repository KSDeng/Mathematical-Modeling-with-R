library(parallel)
library(truncnorm)
library(Rsolnp)

obj<-function(y){
    x <- y[1]; h2 <- y[2]
    P1 <- 2; P2 <- 3; h1 <- 5; s <- 20; 
    -(P1*h1/sqrt((h1^2+x^2)^3)+P2*h2/sqrt((h2^2+(s-x)^2)^3))
}
 
const<-function(y){
    x <- y[1]; h2 <- y[2]
    P1 <- 2; P2 <- 3; h1 <- 5; s <- 20; 
   -(P1*h1*x)/(h1^2+x^2)^2.5 + (P2*h2*(s-x))/(h2^2+(s-x)^2)^2.5
}

nlp.sol<-solnp(pars = c(9.3,6), fun = obj, 
     eqfun = const, eqB = 0, LB = c(0,3), UB = c(20, 9))

