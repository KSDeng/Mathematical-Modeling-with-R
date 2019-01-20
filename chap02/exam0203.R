pre<-fitted.values(lm.sol); rst<-rstandard(lm.sol)
par(mai=c(0.8,0.8, 0.2, 0.1))
plot(pre, rst, xlab="Fitted Values", 
     ylab="Standardized Residuals", xlim=c(116, 158))
text(pre, rst, adj = c(-0.5,0.5))
savePlot("Residuals", type="eps")

