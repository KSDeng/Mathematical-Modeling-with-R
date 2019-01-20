library(igraph)

X <- c(0, 5, 16, 20, 33, 23, 35, 25, 10)
Y <- c(15, 20, 24, 20, 25, 11, 7, 0, 3)
par(mai = c(0.9, 0.9, 0.1, 0.1))
plot(X, Y, cex=1.2, lwd=2, xlim=c(0,35.5), ylim=c(0, 25.5))

vNames<-c('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i')
text(X, Y, label = vNames, adj = c(-0.5,-1)) 

x <-numeric(0); y <- numeric(0)

XX <- c(X, x); YY <- c(Y, y)
n <- length(XX)
W<-matrix(0, nc=n, nr=n)
for (i in 1:(n-1)){
    for (j in (i+1):n){
        W[i,j] <- abs(XX[i]-XX[j]) + abs(YY[i]-YY[j])
        W[j,i] <- W[i,j]
    }
}

g <- graph.adjacency(W, mode = "undirected", weighted=T)
mst <- minimum.spanning.tree(g)
E(mst) ## 需要手工将数据写在"amcm1991B.data"文件中
sum(E(mst)$weight)
sum(E(mst)$weight)+1.2*sum(degree(mst)^(3/2))

## 绘出最优连线(需要先将E(mst)的数据保存在"amcm1991B.data"文件中)
rt<-read.table("amcm1991B.data")
m <- length(rt$s)
for (i in 1:m){
    lines(c(XX[rt$s[i]], XX[rt$t[i]]), c(YY[rt$s[i]], YY[rt$t[i]]),
          type="S", lwd=2)
}

##--添加三个点-------------------------------------##
x <- c(16, 25, 25)
y <- c(20, 7, 3)
points(x,y, pch=19, cex=1.2)

##--添加四个点-------------------------------------##
x <- c(16, 25, 25, 23)
y <- c(20, 7, 3, 20)
points(x,y, pch=19, cex=1.2)

##--添加两个点-------------------------------------##
x <- c(16, 25)
y <- c(20, 7)
points(x,y, pch=19, cex=1.2)

savePlot("mcm666", type="eps")

