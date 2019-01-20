library(lpSolve)
z <- c(66.8, 75.6, 87,   58.6,
       57.2, 66,   66.4, 53,
       78,   67.8, 84.6, 59.4,
       70,   74.2, 69.6, 57.2,
       67.4, 71,   83.8, 62.4)
t <- matrix(z, nr = 5, byrow = TRUE)
t <- cbind(t, rep(0, 5))
assign.sol <- lp.assign(cost.mat = t)
dimnames(assign.sol$solution)<-list(
    c("A", "B", "C", "D", "E"), 
    c("Die", "Yang", "Wa", "ZiYou", "Not"))
assign.sol
assign.sol$solution



