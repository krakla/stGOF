# Function return the Orthnormal polynomial for Exponential distribution
exp_orth <-
  function(k,sigma) {
    if (k==0) {
      h<-function(x){
        y<-1
        return(y)
      }
    }
    else if (k==1) {
      h<-function(x){
        z<-x/sigma
        y<--(-z+1)
        return(y)
      }
    }
    else if (k==2) {
      h<-function(x){
        z<-x/sigma
        y<-1/2*z^2-2*z+1
        return(y)
      }
    }
    else if (k==3) {
      h<-function(x){
        z<-x/sigma
        y<--(-1/6*z^3+3/2*z^2-3*z+1)
        return(y)
      }
    }
    else if (k==4) {
      h<-function(x){
        z<-x/sigma
        y<-1/24*z^4-2/3*z^3+3*z^2-4*z+1
        return(y)
      }
    }
    else if (k==5) {
      h<-function(x){
        z<-x/sigma
        y<--(-1/120*z^5+5/24*z^4-5/3*z^3+5*z^2-5*z+1)
        return(y)
      }
    }
    else if (k==6) {
      h<-function(x){
        z<-x/sigma
        y<-1/720*z^6-1/20*z^5+5/8*z^4-10/3*z^3+15/2*z^2-6*z+1
        return(y)
      }
    }
    else if (k==7) {
      h<-function(x){
        z<-x/sigma
        y<--(-1/5040*z^7+7/720*z^6-7/40*z^5+35/24*z^4-35/6*z^3+21/2*z^2-7*z+1)
        return(y)
      }
    }
    else if (k==8) {
      h<-function(x){
        z<-x/sigma
        y<-1/40320*z^8-1/630*z^7+7/180*z^6-7/15*z^5+35/12*z^4-28/3*z^3+14*z^2-8*z+1
        return(y)
      }
    }
    else if (k==9) {
      h<-function(x){
        z<-x/sigma
        y<--(-1/362880*z^9+1/4480*z^8-1/140*z^7+7/60*z^6-21/20*z^5+21/4*z^4-14*z^3+18*z^2-9*z+1)
        return(y)
      }
    }
    else if (k==10) {
      h<-function(x){
        z<-x/sigma
        y<-1/3628800*z^10-1/36288*z^9+1/896*z^8-1/42*z^7+7/24*z^6-21/10*z^5+35/4*z^4-20*z^3+45/2*z^2-10*z+1
        return(y)
      }
    }
    return(h)
  }
