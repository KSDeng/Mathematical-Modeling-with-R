rt <- read.table("summer_24.data")
X <- matrix(as.numeric(rt[1,]), nc=4)
X <- matrix(as.numeric(rt[2,]), nc=4)
X <- matrix(as.numeric(rt[3,]), nc=4)
X <- matrix(as.numeric(rt[4,]), nc=4)
X <- matrix(as.numeric(rt[5,]), nc=4)
X <- matrix(as.numeric(rt[6,]), nc=4)

chisq.test(X)

fisher.test(X)
