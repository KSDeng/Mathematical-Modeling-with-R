X<-0:6; Y<-c(7, 10, 12, 8, 3, 2, 0)
##%% 计算理论分布, 并用样本均值代替理论期望
F<-ppois(X, mean(rep(X,Y))); m<-length(Y) 
p<-F[1]; p[m]<- 1-F[m-1]
for (i in 2:(m-1))  p[i]<-F[i]-F[i-1]
##%% 作检验
chisq.test(Y, p=p)

Z<-c(7, 10, 12, 8, 5) #%重新分组
m<-length(Z); p<-p[1:m-1]; p[m]<-1-F[m-1] #% 重新计算理论分布
chisq.test(Z, p=p) #%作检验

## 未知参数的情况
source("chi2gof.R")
chi2gof(chisq.test(Z, p=p), nparams=1)
