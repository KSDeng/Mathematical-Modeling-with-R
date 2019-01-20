tree<-data.frame(
    Y=c(23, 25, 21, 14, 15, 20, 17, 11, 26, 21, 
        16, 19, 13, 16, 24, 20, 21, 18, 27, 24,
        28, 30, 19, 17, 22, 26, 24, 21, 25, 26,
        19, 18, 19, 20, 25, 26, 26, 28, 29, 23,
        18, 15, 23, 18, 10, 21, 25, 12, 12, 22, 
        19, 23, 22, 14, 13, 22, 13, 12, 22, 19),
    A=gl(3,20,60, labels= paste("A", 1:3, sep="")),
    B=gl(4,5,60, labels= paste("B", 1:4, sep=""))
)
tree.aov <- aov(Y ~ A+B+A:B, data=tree)
summary(tree.aov)

attach(tree)
tapply(Y, A, mean)
tapply(Y, B, mean)
matrix(tapply(Y, A:B, mean), nr=3, nc=4, byrow=T,
       dimnames=list(levels(A), levels(B)))
interaction.plot(A, B, Y, lwd=2, col=2:5) 
detach(tree)