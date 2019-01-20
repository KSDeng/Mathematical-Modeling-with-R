X<-scan("exam0101.data")
par(mai=c(0.9, 0.9, 0.6, 0.1))
qqnorm(X); qqline(X)
savePlot('Q-Q_plot', type="eps")