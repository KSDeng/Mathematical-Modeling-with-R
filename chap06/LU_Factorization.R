library(Matrix)
A<-matrix(c(1:8, 0), nc=3, nr=3, byrow=T)
A.lu<-lu(A); A.lu
ex<-expand(A.lu); ex
t(ex$P) %*% A; ex$L %*% ex$U

