vNames <- c('x', 'v1', 'v2', 'v3', 'v4', 'y')
d <- data.frame(
    from = c('x','x','v1','v1','v2','v3','v3','v4','v4'), 
    to   = c('v1','v2','v2','v3','v4','v2','y','v3','y'), 
    capacity = c(8, 7, 5, 9, 9, 2, 5, 6, 10)  
)
g <- graph.data.frame(d, vertices = vNames)
mf <- graph.maxflow(g, source=V(g)['x'], target=V(g)['y'])

eNames <- c('x->v1', 'x->v2', 'v1->v2', 'v1->v3', 'v2->v4', 
            'v3->v2', 'v3->y', 'v4->v3', 'v4->y') 
names(mf$flow) <- eNames

mf$value
mf$flow
eNames[mf$cut]
vNames[mf$partition1]
vNames[mf$partition2]



