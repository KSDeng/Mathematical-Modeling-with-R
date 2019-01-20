source("exam0209.R")
with(mouse, tapply(X, A, shapiro.test))
bartlett.test(X ~ A, data=mouse)
