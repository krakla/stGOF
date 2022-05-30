# Function return the MLE estimator(s) for the Logistic distribution
logis.MLE <-
  function(data){
    MU<-mean(data)
    SIGMA<-sqrt(3)*sqrt(sum((data-MU)^2)/length(data))/pi
    return(c(MU,SIGMA))
  }
