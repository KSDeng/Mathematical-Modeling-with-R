f<-function(x,y) x^2*y 
s3<-rk4(f, a=0, b=1, y0=1, n=10)

sfun<-function(x) exp(x^3/3)
yy<-sfun(s3$x)
max(abs(s3$y-yy))

