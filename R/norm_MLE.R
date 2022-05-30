# Function return the MLE estimator(s) for the normal distribution
norm.MLE <- function(data)
{
  MEAN<-mean(data)
  SD<-sqrt(sum((data-MEAN)^2)/length(data))
  return(c(MEAN,SD))
}
