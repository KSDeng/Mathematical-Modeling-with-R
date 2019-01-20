library(igraph)

v <-c(0,2,1,1,  2,0,1,0,  1,1,0,1,  1,0,1,0)        
adjm <- matrix(v, nc = 4, nr = 4, byrow = T)
g7 <- graph.adjacency(adjm, mode = "undirected")
plot(g7)