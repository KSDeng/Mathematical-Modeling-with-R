library(pracma)
source("GPSfun.R"); source("LongLati.R")
xstart <- c(0, 6370, 0, 0.0001)
rt <- read.table("GPS2.data")
sol <- gaussNewton(xstart, GPS_F, GPS_J, data = rt) 
str(LongLati(sol$xs), digits.d=10)
