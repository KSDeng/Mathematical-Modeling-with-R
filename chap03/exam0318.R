library(lpSolve)
z <- scan()
 20   15   16    5    4    7
 17   15   33   12    8    6
  9   12   18   16   30   13
 12    8   11   27   19   14
-99    7   10   21   10   32
-99  -99  -99    6   11   13

cost<-matrix(z, nr = 6, byrow = TRUE)
assign.sol<-lp.assign(cost.mat = cost, direction = "max")
assign.sol
assign.sol$solution

