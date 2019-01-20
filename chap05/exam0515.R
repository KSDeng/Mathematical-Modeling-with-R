##%% 构造图
E <- c(1,2, 1,4, 2,3, 2,5, 3,6, 4,5, 4,7, 5,6, 5,8, 6,9, 
       7,8, 8,9)
W <- c(5, 4, 5, 6, 9, 4, 4, 2, 4, 5, 4, 3)
g <- graph(E, directed=F)

##%% 计算图中奇点之间的最短距离
sp<-shortest.paths(g, v = c(2,4,6,8), to = c(2,4,6,8), weights = W)
diag(sp)<-99  #% 自身之间的距离赋一个较大的值

##%% 最优指派问题
assign.sol <- lp.assign(cost.mat = sp, direction = "min")
dimnames(assign.sol$solution)<-list(c(2,4,6,8), c(2,4,6,8))
assign.sol$solution

##%% 计算每对奇点的最短路
get.shortest.paths(g, from = 2, to = 4, weights = W)
get.shortest.paths(g, from = 6, to = 8, weights = W)
