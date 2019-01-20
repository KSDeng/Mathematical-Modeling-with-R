Vnames = c("u0", "v1", "v2", "v3", "v4", "v5", 
           "v6", "v7", "v8", "v9", "v10")
d <- data.frame(
    from = c("u0", "u0", "u0", "v1", "v1", "v2", "v2", 
       "v2", "v2", "v3", "v4", "v4", "v4", "v5", "v5", 
       "v6", "v6", "v7", "v7", "v8", "v8", "v9"), 
    to   = c("v1", "v2", "v3", "v2", "v4", "v3", "v4", 
       "v5", "v6", "v6", "v5", "v7", "v8", "v6", "v8", 
       "v8", "v9", "v8", "v10","v9", "v10","v10"), 
    weight = c(2,8,1,6,1,7,5,1,2,9,3,2,9,4,6,3,1,7,9,1,2,4)  
)
g <- graph.data.frame(d, directed = F, vertices = Vnames)
shortest.paths(g, v = V(g)['u0'], to = V(g)['v10'])
gs <- get.shortest.paths(g, from = V(g)['u0'], to = V(g)['v10'])
V(g)[gs$vpath[[1]]]

 
