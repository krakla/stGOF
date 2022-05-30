# Function return the Orthnormal polynomial for Poission distribution
pois_orth <-
  function(k,lambda) {
    n<-k
    h<-function(x){
      y<-0
      for (i in 0:n) {
        y<-y + ((-1)^(n-i)*factorial(i)*lambda^(-i)*choose(n,i)*choose(x,i))
      }
      y<-y*sqrt(lambda^n/factorial(n))
      return(y)
    }
    return(h)
  }
