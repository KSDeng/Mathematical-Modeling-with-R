x <- matrix(c(60, 3, 32, 11), nc = 2)
chisq.test(x, correct = FALSE) #% ��������
chisq.test(x) #% ������

##%% Fisher����
X<-matrix(c(60, 3, 32, 11), nc=2)
fisher.test(X)