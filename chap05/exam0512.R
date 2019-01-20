E<-c( 0,1,   0,4,   0,6,   0,5,   0,2,   1,4,  2,3,    2,5,  
      2,6,   3,4,   3,7,   4,9,   4,6,   5,8,  5,11,   6,7, 
     6,10,   6,5,   7,9,  7,10,   7,8,  8,10,  8,15,  8,11, 
     9,12,  9,15,  9,10, 10,13, 10,11, 11,13, 11,15, 11,14, 
    12,15, 13,12, 13,15, 13,14, 14,15) + 1
g<-graph(E)
vertex.connectivity(g, source = 1, target = 16)
edge.connectivity(g, source = 1, target = 16)

vertex.connectivity(as.undirected(g))
edge.connectivity(as.undirected(g))

vertex.disjoint.paths(g, source=1, target=16)
edge.disjoint.paths(g, source=1, target=16)

## »­Í¼
par(mai=c(0,0,0,0) )
V(g)$label<-c("D", 1:14, "Y")
plot(g, layout = layout.fruchterman.reingold)
plot(g, layout = layout.kamada.kawai)

