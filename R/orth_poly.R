# Function return the Orthnormal polynomial for any distribution
orth_poly <-
  function(order,distr="",pars=NA,data=NA,method=""){
    if (distr == "norm"){
      if (method == "MLE" || method == "MME"){
        pars<-norm.MLE(data)
      }
      MEAN<-pars[1]
      SD<-pars[2]

      h<-norm_orth(order,mu=MEAN,sigma=SD)
    }
    else if (distr == "exp"){
      Lambda<-pars[1]

      h<-exp_orth(order,sigma=1/Lambda)
    }
    else if (distr == "pois"){
      Lambda<-pars[1]

      h<-pois_orth(order,lambda=Lambda)
    }
    else if (distr == "unif"){
      if (method == "MLE"){
        pars<-unif.MLE(data)
      }
      else if (method == "MLE"){
        pars<-unif.MME(data)
      }
      MIN<-pars[1]
      MAX<-pars[2]
      h<-unif_orth(order,a=MIN,b=MAX)
    }
    else if (distr == "logis"){
      MU<-pars[1]
      SIGMA<-pars[2]

      h<-logis_orth(k=order,mu=MU,sigma=SIGMA)
    }
    return(h)
  }
