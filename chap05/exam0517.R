city <- c(Pe=1, T=2, Pa=3, M=4, N=5, L=6)
d <- matrix(
    c( 0, 13, 51, 77, 68, 50, 
      13,  0, 60, 70, 67, 59, 
      51, 60,  0, 57, 36,  2, 
      77, 70, 57,  0, 20, 55, 
      68, 67, 36, 20,  0, 34,
      50, 59,  2, 55, 34,  0), 
    nc=6, nr=6)
tsp <- TSP(d, labels = names(city))
tour <- solve_TSP(tsp, method = "2-opt")
tour
labels(tour)

tour<-TOUR(1:6, tsp=tsp)
tour_length(tsp, tour)
tour<-TOUR(c(1,2,3,6,5,4), tsp=tsp)
tour<-TOUR(c(1,2,4,5,6,3), tsp=tsp)


CityNames <- c('Pe', 'T', 'Pa', 'M', 'N', 'L')
CityNames <- c('Pe', 'T', 'Pa', 'L', 'N', 'M')
CityNames <- c('Pe', 'T', 'M', 'N', 'L', 'Pa')
city[CityNames]