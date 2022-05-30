# Function return the MLE estimator(s) for the Unifrom distribution
unif.MLE <-
  function(sample){
    MIN<-min(sample)
    MAX<-max(sample)
    return(c(MIN,MAX))
  }
