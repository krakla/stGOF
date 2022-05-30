# Function return the Orthnormal polynomial for Logistic distribution
logis_orth <-
  function(k,mu,sigma) {
    if (k==0) {
      h<-function(x){
        y<-1
        return(y)
      }
    }
    else if (k==1) {
      h<-function(x){
        z<-(x-mu)/sigma
        y<-sqrt(3)/pi*z
        return(y)
      }
    }
    else if (k==2) {
      h<-function(x){
        z<-(x-mu)/sigma
        y<-3/sqrt(3.2)/pi^2*(z^2-pi^2/3)
        return(y)
      }
    }
    else if (k==3) {
      h<-function(x){
        z<-(x-mu)/sigma
        y<-5*sqrt(7)/12/pi^3*(z^3-4.2*pi^2/3*z)
        return(y)
      }
    }
    else if (k==4) {
      h<-function(x){
        z<-(x-mu)/sigma
        y<-35/64/pi^4*(z^4-26/7*pi^2*z^2+27/35*pi^4)
        return(y)
      }
    }
    return(h)
  }

