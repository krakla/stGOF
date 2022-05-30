# Function return the MLE estimator(s) for the Poisson distribution
pois.MLE <-
  function(sample){
    lambda<-mean(sample)
    return(lambda)
  }
