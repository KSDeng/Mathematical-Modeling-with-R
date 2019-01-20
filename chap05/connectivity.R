g13_1 <- graph(c(1,2, 3,2))
g13_2 <- graph(c(1,4, 4,2, 2,1, 3,4))
g13 <- g13_1 + g13_2

is.connected(g13)
is.connected(g13_1)
is.connected(g13_2)

clusters(g13)