X<-0:6; Y<-c(7, 10, 12, 8, 3, 2, 0)
##%% �������۷ֲ�, ����������ֵ������������
F<-ppois(X, mean(rep(X,Y))); m<-length(Y) 
p<-F[1]; p[m]<- 1-F[m-1]
for (i in 2:(m-1))  p[i]<-F[i]-F[i-1]
##%% ������
chisq.test(Y, p=p)

Z<-c(7, 10, 12, 8, 5) #%���·���
m<-length(Z); p<-p[1:m-1]; p[m]<-1-F[m-1] #% ���¼������۷ֲ�
chisq.test(Z, p=p) #%������

## δ֪���������
source("chi2gof.R")
chi2gof(chisq.test(Z, p=p), nparams=1)