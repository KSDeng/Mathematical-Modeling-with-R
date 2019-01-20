data<-scan("exam0204.data")
X<-data[1:53]; Y<-data[54:106]
lm.sol<-lm(Y~X); summary(lm.sol)
library(MASS) #% 加载MASS程序包

##%% 作图, 共4张
op <- par(mfrow=c(2,2), mar=.4+c(4,4,1,1), oma= c(0,0,2,0))
##%% 第1张, 残差与预测散点图
plot(fitted(lm.sol), resid(lm.sol), 
     cex=1.2, pch=21, col="red", bg="orange", 
     xlab="Fitted Value", ylab="Residuals")
##%% 第2张, 确定参数lambda
boxcox(lm.sol, lambda=seq(0, 1, by=0.1))
##%% Box-Cox变换后, 作回归分析
lambda<-0.55; Ylam<-(Y^lambda-1)/lambda
lm.lam<-lm(Ylam~X); summary(lm.lam)
##%% 第3张, 变换后残差与预测散点图
plot(fitted(lm.lam), resid(lm.lam), 
     cex=1.2, pch=21, col="red", bg="orange", 
     xlab="Fitted Value", ylab="Residuals")
##%% 第4张, 回归曲线和相应的散点
beta0<-lm.lam$coefficients[1]
beta1<-lm.lam$coefficients[2]
curve((1+lambda*(beta0+beta1*x))^(1/lambda), 
      from=min(X), to=max(X), col="blue", lwd=2, 
      xlab="X", ylab="Y")
points(X,Y, pch=21, cex=1.2, col="red", bg="orange")
mtext("Box-Cox Transformations", outer = TRUE, cex=1.5)
par(op)

