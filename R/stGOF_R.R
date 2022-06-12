#Function returns the score statistics of Smooth test result (regular function)
stGOF_R <- function(distr="", data=NA, order=NULL, method = "", output=TRUE)
{

  #Prepare
  distr_name<-switch(distr,
                     norm = "Normal",
                     exp = "Exponential",
                     pois = "Poisson",
                     unif = "Uniform",
                     logis = "Logistic")
  inital.res <- prepare.fun(distr=distr, data, method)
  n <- inital.res[1]
  min.order <- inital.res[2]
  pars <- switch(distr,
                 norm = inital.res[3:4],
                 exp = inital.res[3],
                 pois = inital.res[3],
                 unif = inital.res[3:4],
                 logis = inital.res[3:4])
  p_val <- rep(0, order - min.order + 1 + 1)
  STAll <- test.stat(order, distr, data, method)


  ST <- STAll$Tstat
  ind.comp<-1:(length(ST)-1)

  p_val <- pchisq(c((ST[ind.comp])^2,ST[order-min.order+2]),
                  df = c(rep(1, order - min.order + 1), order - min.order + 1),
                  lower.tail = FALSE)

  statistics <- ST
  q <- length(statistics)

  #Results
  cat("  Results of the Smooth test\n")
  cat("  Ho:", distr_name, "against", order, "th order alternative\n")
  cat("  Parameter estimation method:", method, "\n")
  cat("  Parameter estimates:", pars, " (",names(pars),")\n\n")
  cat("\n")


  cat("  All p-values are obtained by the asymptotical chi-square approximation", "\n")

  cat("\n")

  cat("    Smooth test statistic S_k :", round(statistics[q], 4), "\n")
  cat("               p-value        :", round(p_val[q], 5), "\n")
  cat("\n")

  cnt <- 1
  for (i in (order - q + 2):order) {

    cat("  ", i, "th theoretically component V_k =", round(statistics[cnt], 5),
        " p-value =", round(p_val[cnt],5), "\n")

    cnt <- cnt + 1
  }
  comp <- STAll$comp
  Sigma<-STAll$Sigma
  EVar<-STAll$EVar

  invisible(list(statistics = statistics, p.value = p_val, par.est = pars,
                 comp = comp, Sigma=Sigma, EVar=EVar))
}
