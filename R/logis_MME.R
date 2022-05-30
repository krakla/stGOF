# Function return the MME estimator(s) for the Logistic distribution
logis.MME <-
  function(data){
    MU<-mean(data)
    SIGMA<-sqrt(3)*sqrt(sum((data-MU)^2)/length(data))/pi
    return(c(MU,SIGMA))
  }
