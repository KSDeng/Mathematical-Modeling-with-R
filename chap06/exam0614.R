library(pracma)
f <- function(x, y, z) (y*sin(x) + z*cos(x));
Q <- triplequad(f, 0, pi, 0, 1, -1, 1); Q
