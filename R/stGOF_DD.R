#data-driven bootstrap function to select the order using criterion ("AIC" or "BIC") and horizon ("order" or "subset")
stGOF_DD <-
  function(data,max.order,horizon="",criterion="",distr="",method="",B=200) {
    # prepare
    inital.res <- prepare.fun(distr=distr, data, method)
    n <- inital.res[1]
    min.order <- inital.res[2]
    pars <- switch(distr,
                   norm = inital.res[3:4],
                   exp = inital.res[3],
                   pois = inital.res[3],
                   unif = inital.res[3:4],
                   logis = inital.res[3:4])
    ind.f<-1

    # construction of the horizon
    if(horizon=="order") {
      n.S<-max.order-min.order+1
      S<-list()
      S.df<-rep(NA,n.S)
      for(i in 1:n.S) {
        S[[i]]<-(min.order:max.order)[1:i]
        S.df[i]<-length(S[[i]])
      }
    }
    if(horizon=="subset") {
      models<-subset_model(max.order-min.order+1)
      n.S<-length(models)
      S.df<-rep(NA,n.S)
      S<-models
      for(i in 1:n.S) {
        S[[i]]<-models[[i]]+min.order-1
        S.df[i]<-length(models[[i]])
      }
    }

    # computing the score test statistics for models in horizon S
    AllStats<-ss_all(data,S=S,min.order=min.order,
                                   distr=distr,method=method)

    stats<-AllStats$stats
    thetas<-AllStats$theta
    selector<-switch(criterion,
                     AIC=stats-2*S.df,
                     BIC=stats-S.df*log(n))

    model.dd<-which.max(selector)
    stat.dd<-NA
    try(stat.dd<-stats[model.dd],silent=TRUE)
    if (is.na(stat.dd)) stop("The data driven smooth test is not defined.")

    S.dd<-S[[model.dd]]
    theta<-thetas[S.dd-min.order+1]

    # bootstrap null distribution
    if(!is.null(B)) {
      nd<-rep(NA,B)
      for(i in 1:B) {
        x<-switch(distr,
                  norm=rnorm(n, mean=pars[1], sd=pars[2]),
                  exp=rexp(n, rate=pars[1]),
                  pois=rpois(n, lambda=pars[1]),
                  unif=runif(n, min=pars[1], max=pars[2]),
                  logis=rlogis(n, location=pars[1], scale=pars[2]))

        AllStats<-ss_all(x,S=S,min.order=min.order,
                                       distr=distr,method=method)

        stats<-AllStats$stats
        selector<-switch(criterion,
                         AIC=stats-2*S.df,
                         BIC=stats-S.df*log(n))


        model.dd<-which.max(selector)
        try(nd[i]<-stats[model.dd],silent=TRUE)
      }
      p.value<-mean(stat.dd<=nd[!is.na(nd)])

    }

    #Results
    cat("       Result for Data-Driven Smooth goodness-of-fit test\n")
    cat("       Null hypothesis:", distr, "against", max.order,
        "th order alternative\n")
    cat("       Parameter estimation method:", method, "\n")

    par_est <- "no parameter estimation needed"
    cat("       Parameter estimates:", pars, " (",names(pars),")\n\n")

    cat("       Horizon:",horizon,"\n")
    cat("       Selection criterion:",criterion,"\n\n")

    cat("     All p-values are obtained by the bootstrap with", B, "runs\n")
    cat("\n")

    cat("   Data-Driven Smooth test statistic S_k =", round(stat.dd, 5),
        "p-value =", round(p.value, 5),"\n")
    cat("    Selected model:",S.dd,"\n\n")

    invisible(list(stat=stat.dd,model=S.dd,p.value=p.value,par.est=par_est))
  }

