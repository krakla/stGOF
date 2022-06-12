#Function returns the score statistics of Smooth test result with Henze and Klar rescaling of the components
stGOF_B <- function(distr="", data=NA, order=NULL, method = "", B = NULL,
                    output=TRUE)
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

  ST[ind.comp]<-ST[ind.comp]*(sqrt(diag(STAll$Sigma)[ind.comp]))/sqrt(STAll$EVar)

  T <- matrix(0, order - min.order + 1 + 1, B)
  for (j in 1:B) {
    data<-switch(distr,
                 norm=rnorm(n, mean=pars[1], sd=pars[2]),
                 exp=rexp(n, rate=pars[1]),
                 pois=rpois(n, lambda=pars[1]),
                 unif=runif(n, min=pars[1], max=pars[2]),
                 logis=rlogis(n, location=pars[1], scale=pars[2]))

    STAll.B<-try(test.stat(order, distr, data, method),silent=TRUE)


    if (!inherits(STAll.B,"try-error")) {
      T[, j] <- STAll.B$Tstat
    }
    T[ind.comp,j]<-T[ind.comp,j]*(sqrt(diag(STAll.B$Sigma)[ind.comp]))/sqrt(STAll.B$EVar)
  }
  for (i in 1:(order - min.order + 1)) {
    tmp <- mean(T[i, ] >= ST[i])
    p_val[i] <- 2*min(tmp,1-tmp)
  }
  p_val[order-min.order+2] <- mean(T[order-min.order+2, ] >= ST[order-min.order+2])

  statistics <- ST
  q <- length(statistics)

  #Results
  cat("  Results of the Smooth test\n")
  cat("  Ho:", distr_name, "against", order, "th order alternative\n")
  cat("  Parameter estimation method:", method, "\n")
  cat("  Parameter estimates:", pars, " (",names(pars),")\n\n")
  cat("\n")


  cat("  All p-values are obtained by the bootstrap with", B, "runs\n\n")

  cat("\n")

  cat("    Smooth test statistic S_k :", round(statistics[q], 4), "\n")
  cat("               p-value        :", round(p_val[q], 5), "\n")
  cat("\n")

  cnt <- 1
  for (i in (order - q + 2):order) {
    cat("  ", i, "th empirically rescaled component V_k =", round(statistics[cnt], 5),
        " p-value =", round(p_val[cnt],5), "\n")

    cnt <- cnt + 1
  }
  comp <- STAll$comp
  Sigma<-STAll$Sigma
  EVar<-STAll$EVar

  invisible(list(statistics = statistics, p.value = p_val, par.est = pars,
                 comp = comp, Sigma=Sigma, EVar=EVar))
}
