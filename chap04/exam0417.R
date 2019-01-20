f<-function(x){
    P1<-2; P2<-3; h1<-5; h2<-6; s<-20
    P1*h1/sqrt((h1^2+x^2)^3)+P2*h2/sqrt((h2^2+(s-x)^2)^3)
}
optimize(f, lower = 0, upper = 20)
optimize(f, lower = 0, upper = 20, maximum = TRUE)

