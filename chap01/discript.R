discript<-function(x){
   R1<-quantile(x, 3/4, names=F)-quantile(x, 1/4, names=F)
   data.frame(
      n=length(x), max=max(x), min=min(x), 
      R=max(x)-min(x), R1=R1, 
      mean=mean(x), median=median(x), 
      sd=sd(x) 
   )
}

