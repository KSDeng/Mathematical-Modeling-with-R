library(lpSolve)
c <- rep(1,8); b <- rep(1, 11)
A <- matrix(nc = 3, by = TRUE, data = 
    c(1, 1, 1,   1, 2, 1,   
      2, 2, 1,   2, 3, 1,
      3, 4, 1,   3, 5, 1, 
      4, 7, 1,   4, 8, 1, 
      5, 6, 1,   5, 7, 1, 
      6, 2, 1,   6, 6, 1, 
      7, 1, 1,   7, 6, 1, 
      8, 4, 1,   8, 7, 1, 
      9, 2, 1,   9, 4, 1, 
     10, 5, 1,  10, 8, 1, 
     11, 3, 1,  11, 5, 1))
lp.sol <- lp(objective.in = c, dense.const = A, 
    const.dir = rep(">=", 11), const.rhs = b, 
    all.bin = TRUE)
lp.sol
lp.sol$solution

