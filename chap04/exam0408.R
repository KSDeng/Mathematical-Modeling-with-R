## 不用梯度
obj <- function(x){
    F <- c(10*(x[2]-x[1]^2), 1-x[1])
    sum(F^2)
}
nlm(obj, c(-1.2, 1))

## 使用梯度
source("Rosenbrock.R")
nlm(obj, c(-1.2, 1))


