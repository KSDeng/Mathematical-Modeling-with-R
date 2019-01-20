mt <- c(-4.7, -2.3, 4.4, 13.2, 20.2, 24.2, 26.0, 24.6, 19.5, 12.5, 4.0, -2.8)
monthlen <- c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
month = rep(1:12, monthlen)
midmonth <- tapply(1:365, month, median)
x <- c(midmonth, midmonth[1] + 365)
y <- mt[c(1:12, 1)]
s = splinefun(x, y, method = "periodic")

par(mai=c(.9, .9, .6, .2))
plot(1:365, s(1:365), type = "l", 
     lwd=2, col="blue", lab=c(7, 7, 12),
     xlab = "Day of the Year",
     ylab = "Temperature (Degrees C)",
     main = "Monthly Average Temperature")
points(x[-13], y[-13], pch = 19, cex=1.2, col="red")

savePlot("temp", type="eps")
