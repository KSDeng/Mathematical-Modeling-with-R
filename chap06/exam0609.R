x<-c(1, -1, 2); y<-c(2, 1, 4); X<-cbind(1,x)
solve(t(X) %*% X, t(X) %*% y)

X.qr <- qr(X); Q1 <- qr.Q(X.qr); R1 <- qr.R(X.qr)
solve(R1, t(Q1)%*%y)

qr.coef(X.qr, y)
qr.qy(X.qr, y)
qr.qty(X.qr, y)

qr.coef(X.qr, y)
qr.solve(X, y)
