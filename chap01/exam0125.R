X <- scan("exam0125.data", nlines = 3)
Y <- scan("exam0125.data", skip = 3)
ks.test(X,Y)
