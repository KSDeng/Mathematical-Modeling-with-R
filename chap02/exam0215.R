library(MASS)
train <- matrix(
    c(24.8, 24.1, 26.6, 23.5, 25.5, 27.4, 
      22.1, 21.6, 22.0, 22.8, 22.7, 21.5, 22.1, 21.4, 
      -2.0, -2.4, -3.0, -1.9, -2.1, -3.1,
      -0.7, -1.4, -0.8, -1.6, -1.5, -1.0, -1.2, -1.3),
    ncol=2)
sp <- factor(rep(1:2, c(6,8)), labels = c("Have", "No"))
tst <- c(23.5, -1.6)
lda.sol <- lda(train, sp)

predict(lda.sol, tst)$class
table(sp, predict(lda.sol)$class)

qda.sol<-qda(train, sp)
predict(qda.sol, tst)$class
table(sp, predict(qda.sol)$class)
