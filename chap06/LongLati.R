LongLati <- function(x){
    #% 直角坐标转化成经纬度坐标
    r <- sqrt(x[1]^2 + x[2]^2 + x[3]^2)
    Latitude  <- asin(x[3]/r)
    Longitude <- acos(x[1]/(r*cos(Latitude)))
    Latitude  <- 180*Latitude/pi
    Longitude <- 180*Longitude/pi
    list(longitude = Longitude, latitude = Latitude) 
}
