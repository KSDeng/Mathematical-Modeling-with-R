newdata <- data.frame(X1 = 80, X2 = 40)
predict(lm.sol, newdata, interval="prediction") 
predict(lm.sol, newdata, interval="confidence") 
