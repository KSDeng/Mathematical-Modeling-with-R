source("exam0504.R")
mst <- minimum.spanning.tree(g8)
E(mst)

E(mst)$width<-2
plot(mst, edge.label = E(mst)$weight,
     layout = layout.circle, add=T)

