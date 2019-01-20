f<-function(x,y) x^2*y 
s1<-euler_heun(f, a=0, b=1, y0=1, n = 10, improved = F)
s2<-euler_heun(f, a=0, b=1, y0=1, n = 10)

sfun<-function(x) exp(x^3/3)
yy<-sfun(s1$t)

cbind(s1$t, s1$y, s2$y, yy)
