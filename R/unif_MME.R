# Function return the MME estimator(s) for the Unifrom distribution
unif.MME <-
  function(sample){
    m<-mean(sample)
    s<-sum((sample-m)^2)/length(sample)
    pars<-c(m-sqrt(3*s),m+sqrt(3*s))
    return(pars)
  }
