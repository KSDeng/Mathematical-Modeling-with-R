rt<-read.table("summer_22.data")
rt$ratio<-rt$unqualified/rt$sampling
cor.test(~distance+ratio, data=rt, subset=1:18, method = "spearman")
cor.test(~distance+ratio, data=rt, subset=19:36, method = "spearman")

cor.test(~distance+ratio, data=rt, method = "spearman")
