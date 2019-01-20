E <- c(1,2,  1,3,  2,3,  2,5,  3,4,  3,6,  3,7,
       4,5,  4,9,  5,1,  5,6,  7,1,  7,8,  8,2,
       8,5,  8,9,  9,5, 9,10, 10,1, 10,6)
g3 <- graph.empty(10)
V(g3)$label <- letters[1:10]
g3 <- add.edges(g3, E)

g3 <- graph.empty() + vertices(letters[1:10])
g3 <- g3 + edges(E)
