# Preparation function returns length of the data vector, the minimum order and the estimator(s) for each distribtuion
prepare.fun <- function( distr="", data=NA, method=""){
  n <- length(data)
  names(n) <- "length"
  min.order<-switch(distr,
                    norm=3,
                    exp=2,
                    pois=2,
                    unif=3,
                    logis=3)

  names(min.order) <- "min.order"

  if(method == "MLE"){
    pars <- switch(distr,
                   norm = norm.MLE(data),
                   exp = exp.MLE(data),
                   pois = pois.MLE(data),
                   unif=unif.MLE(data))

    names(pars) <- switch(distr,
                          norm = c("mean","sd"),
                          exp = c("lambda"),
                          pois = c("lambda"),
                          unif = c("min","max"))
  }
  if(method == "MME"){
    pars <- switch(distr,
                   norm = norm.MLE(data),
                   exp = exp.MLE(data),
                   pois = pois.MLE(data),
                   unif=unif.MME(data),
                   logis=logis.MME(data))
    names(pars) <- switch(distr,
                          norm = c("mean","sd"),
                          exp = c("lambda"),
                          pois = c("lambda"),
                          unif = c("min","max"),
                          logis=c("location","scale"))

  }

  return(c(n, min.order, pars))
}


