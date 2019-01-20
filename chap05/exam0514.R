library(igraph)

E <- c(1,2, 1,3, 1,4, 2,3, 2,5, 2,6, 3,4, 3,5, 4,5, 4,6, 5,6) 
W <- c( 6,   3,   2,   3,   2,   1,   2,   2,   1,   5,   4)
g <- graph.empty(directed=F)+vertices(1:6)+edges(E)
get.shortest.paths(g, from = 1, to = 6, weights = W)
