source("poly_inter.R")           #% ���ò�ֵ����
fun <- function(x) 1/(1+x^2)     #% ����f(x)
x <- -5:5; y <- fun(x)           #% ��ֵ�ڵ㼰����ֵ 
xout <- seq(from=-5, to = 5, by=0.1)
yout <- poly_inter(x, y, xout)

par(mai = c(0.8, 0.8, 0.1, 0.1))  #% �����ǻ�ͼ
plot(x, y, ylim=c(min(yout), max(yout)), pch=19)
lines(xout, fun(xout), lty=5, lwd=2, col=4)
lines(xout, yout, lty=1, lwd=2, col=2)
abline(h=0, v=0)
legend(-3, 2, c(expression(y==f(x)), expression(y==p[10](x))), 
       lty=c(5,1), col=c(4,2), lwd=2) 
savePlot("poly_inter", type="eps")