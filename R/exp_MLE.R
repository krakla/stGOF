# Function return the MLE estimator(s) for the Exponential distribution
exp.MLE <-
  function(sample){
    LAMBDA<-1/mean(sample)
    return(LAMBDA)
  }
