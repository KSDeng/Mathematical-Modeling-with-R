X<-scan("exam0101.data")
par(mai=c(0.8, 0.8, 0.5, 0.1))
## figure 1
hist(X, col="lightblue", border="red", labels = TRUE,
     ylim=c(0, 14.5))
savePlot('hist_o', type="eps")

## figure 2
r <- hist(X, freq = FALSE, density = 10, 
          angle = 15+30*1:6)
text(r$mids, 0, r$counts, adj=c(.5, -.5), cex=1.2 )
lines(density(X), col = "blue", lwd=2)
x <- seq(from = 20, to = 100, by = 1)
lines(x, dnorm(x, mean(X), sd(X)), col="red", lwd=2)
savePlot('hist_a', type="eps")


