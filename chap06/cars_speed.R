rt <- read.table("cars_speed.data")
X <- cbind(rt$v, rt$v^2); y <- rt$d
coef <- qr.solve(X, y); coef

dist <- function(v) coef[1]*v + coef[2]*v^2
dist(50)

