chi2gof <- function(chi2test, nparams){
    df <- chi2test$parameter - nparams;   
  Pval <- 1-pchisq(chi2test$statistic, df)
  names(Pval) <- "P-val"
  c(chi2test$statistic, Pval, df)
}

