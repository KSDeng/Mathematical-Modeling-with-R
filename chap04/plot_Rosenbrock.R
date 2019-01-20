x<-seq(from=-2, to=2, by=0.01)
y<-seq(from=-1, to=3, by=0.01)
f<-function(x,y) 100*(y-x^2)^2+(1-x)^2
z<-outer(x, y, f)
par(mai=c(.9, .8, 0.3, 0.1))
contour(x,y,z, 
    levels = c(0.5, 3, 15, 40, 80, 150, 250, 400, 
       600, 850, 1100, 1600, 2200), 
    xlab = "X", ylab ="Y", 
    col = "blue", lwd=1)
points(1,1,pch=19, cex=1.2, col="red")
savePlot("Rosenbrock", type="eps")

