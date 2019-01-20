library(igraph)

E <- c(1,2, 1,3, 2,4, 2,5, 3,5, 3,8, 3,9, 4,5, 4,6, 
       5,6, 6,7, 7,8, 7,9, 7,10, 9,10)
W <- c(122, 359, 345, 167, 180, 195, 246, 443, 415, 
        92, 213,  79, 199, 163, 215)
g <- graph.empty(directed=F)+vertices(1:10)+edges(E)

sp <- shortest.paths(g, v = 3, weights = W)
gs <- get.shortest.paths(g, from = 3, weights = W)

for (i in 1:10)
    if (i != 3)
        print(c(i, sp[i], gs$vpath[[i]]) )


E(g)$label<-W
par(mai=c(0,0,0,0))
plot(g,layout=layout.reingold.tilford)

E(g, P=c(3,1, 3,5, 5,2, 5,4, 5,6, 3,8, 8,7, 3,9, 7,10))$width<-3
plot(g,layout=layout.reingold.tilford(g), add=T)
