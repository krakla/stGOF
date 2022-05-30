# Function return the Orthnormal polynomial for Uniform distribution
unif_orth <-
  function(k,a,b) {
    n<-k
    h<-function(x){
      z<-(x-a)/(b-a)
      y<-0
      for (i in 0:n) {
        y<-y + ((-1)^(n)*(-z)^(i)*choose(n,i)*choose(n+i,i))
      }
      y<-y*sqrt(2*n+1)
      return(y)
    }
    return(h)
  }
