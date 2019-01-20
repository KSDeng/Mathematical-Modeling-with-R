x <- matrix(c(60, 3, 32, 11), nc = 2)
chisq.test(x, correct = FALSE) #% 不作修正
chisq.test(x) #% 作修正

##%% Fisher检验
X<-matrix(c(60, 3, 32, 11), nc=2)
fisher.test(X)
