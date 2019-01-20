airdata<-data.frame(
   E=factor(c("fog", "fog", "fog", "fog", "air", "fog", 
              "air", "fog", "fog", "air", "fog", "air")), 
   S=c(38.2, 28.6, 30.2, 23.7, 74.1, 88.2, 46.4, 135.9, 
       102.9, 28.9, 46.9, 44.3),
   O=c(10.3, 6.9, 6.2, 12.4, 45.8, 9.9, 27.4, 44.8, 
       27.8, 6.5, 11.2, 16.6)
)
airdata$R<-airdata$O/airdata$S
t.test(R ~ E, data = airdata, var.equal = TRUE)
