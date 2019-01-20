##%% ��ȡ����
rt <- read.table("exam0518.data"); n <- 280
##%% �������֮��ľ���, ������"����"����
d <- matrix(0, nc = n, nr = n)
for(i in 1:(n-1)){
   for(j in (i+1):n){
      d[i,j] <- abs(rt$x[i]-rt$x[j])+abs(rt$y[i]-rt$y[j])
      d[j,i] <- d[i,j]
   }
}
##%% TSP����
tsp <- TSP(d)
initial_tour <- solve_TSP(tsp, method="nn")
tour <- solve_TSP(tsp, method = "2-opt", 
         control = list(tour = initial_tour))
tour_length(tsp, tour)
##%% ��ͼ
par(mai = c(0.9, 0.9, 0.2, 0.2))
plot(rt)
N<-as.numeric(labels(tour))
N<-c(N, N[1])
for (i in 1:280){
   x <- c(rt$x[N[i]], rt$x[N[i+1]])
   y <- c(rt$y[N[i]], rt$y[N[i+1]])
   lines(x, y, type='s')
}

savePlot("tsp_280", type="eps")