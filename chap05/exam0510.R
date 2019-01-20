library(igraph)

V <- c("A3", "B4", "B1", "C5", "C2", "C1", "D6", "D3", 
       "D2", "D1", "E4", "E3", "E2", "E1", "F")
E <- c( 1,2,   1,3,   2,4,   2,6,   3,5,  3,6,    4,7, 4,10,
        5,8,  5,10,   6,9,  6,10,  7,14, 8,11,   8,14, 9,12,  
       9,14, 10,13, 10,14, 11,15, 12,15, 13,15, 14,15) 
W <- c(15.7, -30.2, 13.8, -50.2,  18.4, -0.2,  12.2, -70.2, 
       17.3, -20.2, 18.4,  -0.2, -75.2, 15.7, -30.2,  17.3, 
      -20.2,  18.4, -0.2,    30,    50,   60,    80)
g <- graph.empty()+vertices(V)+edges(E)
shortest.paths(g, v = 1, to = 15, weights = 100-W)

gs <- get.shortest.paths(g, from = 1, to = 15, weights = 100-W)
V[gs$vpath[[1]]]

gas <- get.all.shortest.paths(g, from = 1, to = 15, weights = 100-W)
V[gas$res[[1]]]
V[gas$res[[2]]]

