rt<-read.table("summer_1.data")

prop.test(x=rt$microorganism, n=rt$sampling)
pairwise.prop.test(x=rt$microorganism, n=rt$sampling)
prop.trend.test(x=rt$microorganism, n=rt$sampling)

prop.test(x=rt$metal, n=rt$sampling)
pairwise.prop.test(x=rt$metal, n=rt$sampling)
prop.trend.test(x=rt$metal, n=rt$sampling)

prop.test(x=rt$additive, n=rt$sampling)
pairwise.prop.test(x=rt$additive, n=rt$sampling)
prop.trend.test(x=rt$additive, n=rt$sampling)

prop.test(x=rt$others, n=rt$sampling)
pairwise.prop.test(x=rt$others, n=rt$sampling)
prop.trend.test(x=rt$others, n=rt$sampling)

prop.test(x=rt$unqualified, n=rt$sampling)
pairwise.prop.test(x=rt$unqualified, n=rt$sampling)
prop.trend.test(x=rt$unqualified, n=rt$sampling)

