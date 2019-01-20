data<-scan("exam0204.data")
X<-data[1:53]; Y<-data[54:106]
lm.sol<-lm(Y~X); summary(lm.sol)
library(MASS) #% ����MASS�����

##%% ��ͼ, ��4��
op <- par(mfrow=c(2,2), mar=.4+c(4,4,1,1), oma= c(0,0,2,0))
##%% ��1��, �в���Ԥ��ɢ��ͼ
plot(fitted(lm.sol), resid(lm.sol), 
     cex=1.2, pch=21, col="red", bg="orange", 
     xlab="Fitted Value", ylab="Residuals")
##%% ��2��, ȷ������lambda
boxcox(lm.sol, lambda=seq(0, 1, by=0.1))
##%% Box-Cox�任��, ���ع����
lambda<-0.55; Ylam<-(Y^lambda-1)/lambda
lm.lam<-lm(Ylam~X); summary(lm.lam)
##%% ��3��, �任��в���Ԥ��ɢ��ͼ
plot(fitted(lm.lam), resid(lm.lam), 
     cex=1.2, pch=21, col="red", bg="orange", 
     xlab="Fitted Value", ylab="Residuals")
##%% ��4��, �ع����ߺ���Ӧ��ɢ��
beta0<-lm.lam$coefficients[1]
beta1<-lm.lam$coefficients[2]
curve((1+lambda*(beta0+beta1*x))^(1/lambda), 
      from=min(X), to=max(X), col="blue", lwd=2, 
      xlab="X", ylab="Y")
points(X,Y, pch=21, cex=1.2, col="red", bg="orange")
mtext("Box-Cox Transformations", outer = TRUE, cex=1.5)
par(op)
