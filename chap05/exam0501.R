library(igraph)

e <- c(1,2, 2,2, 2,4, 1,4, 3,1, 3,4, 4,3, 4,5) 
g1 <- graph(edges = e, directed = FALSE)
eNames <- paste("e", 1:8, sep="")
plot(g1, layout=layout.circle, edge.label=eNames)
g2 <- graph(edges = e)
plot(g2, layout=layout.circle, edge.label=eNames)

V(g1)
E(g2)

E(g2, P = c(1, 2, 4, 5))
E(g2, path = c(1, 2, 4, 5))

g<-as.directed(g1, mode = "arbitrary")
plot(g, layout=layout.circle, edge.label=eNames)

g<-as.undirected(g2, mode = "each")
plot(g, layout=layout.circle, edge.label=eNames)

g<-as.undirected(g2)
plot(g, layout=layout.circle, edge.label=eNames)

