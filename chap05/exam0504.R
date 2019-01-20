library(igraph)

w <- c(1,  
       3, 6,
       2, 2, 4,
       8, 7, 0, 5,
       3, 1, 0, 6, 2)
W <- matrix(0, nc = 6, nr = 6)
for (i in 2:6)
   for (j in 1:(i-1))
      W[i,j] <- w[(i-1)*(i-2)/2+j]
colnames(W) <- LETTERS[1:6]
g8 <- graph.adjacency(W, mode="lower", weighted=T) 


label<-c(1, 3, 6, 2, 2, 4, 8, 7, 5, 3, 1, 6, 2)
plot(g8, layout = layout.circle, edge.label = label)