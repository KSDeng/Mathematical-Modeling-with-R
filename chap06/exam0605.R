fun <- function(x) 1/(1+x^2)  #% 函数f(x)
x <- -5:5; y <- fun(x)        #% 插值节点及函数值 
s <- spline(x, y, xout = seq(-5, 5, 0.1))

par(mai = c(0.8, 0.9, 0.1, 0.1))  #% 以下是绘图
plot(s$x, s$y-fun(s$x), type="l", lwd=2, col=4, 
     xlab = "x", ylab = expression(S(x)-f(x)))
abline(h=0, v=0)

savePlot("spline_diff", type="eps")