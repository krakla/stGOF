# Function return the Orthnormal polynomial for Normal distribution
norm_orth <-
  function(k,mu,sigma){

    if (k==0) {
      h<-function(x){
        y<-1
        return(y)
      }
    }
    else if (k==1) {
      h<-function(x){
        z<-(x-mu)/sigma
        y<-z
        return(y)
      }
    }
    else if (k==2) {
      h<-function(x){
        z<-(x-mu)/sigma
        y<-1/2*2^(1/2)*z^2-1/2*2^(1/2)
        return(y)
      }
    }
    else if (k==3) {
      h<-function(x){
        z<-(x-mu)/sigma
        y<-1/6*3^(1/2)*2^(1/2)*z^3-1/2*3^(1/2)*2^(1/2)*z
        return(y)
      }
    }
    else if (k==4) {
      h<-function(x){
        z<-(x-mu)/sigma
        y<-1/12*6^(1/2)*z^4-1/2*6^(1/2)*z^2+1/4*6^(1/2)
        return(y)
      }
    }
    else if (k==5) {
      h<-function(x){
        z<-(x-mu)/sigma
        y<-1/60*15^(1/2)*2^(1/2)*z^5-1/6*15^(1/2)*2^(1/2)*z^3+1/4*15^(1/2)*2^(1/2)*z
        return(y)
      }
    }
    else if (k==6) {
      h<-function(x){
        z<-(x-mu)/sigma
        y<-1/60*5^(1/2)*z^6-1/4*5^(1/2)*z^4+3/4*5^(1/2)*z^2-1/4*5^(1/2)
        return(y)
      }
    }
    else if (k==7) {
      h<-function(x){
        z<-(x-mu)/sigma
        y<-1/840*70^(1/2)*2^(1/2)*z^7-1/40*70^(1/2)*2^(1/2)*z^5+1/8*70^(1/2)*2^(1/2)*z^3-1/8*70^(1/2)*2^(1/2)*z
        return(y)
      }
    }
    else if (k==8) {
      h<-function(x){
        z<-(x-mu)/sigma
        y<-1/1680*70^(1/2)*z^8-1/60*70^(1/2)*z^6+1/8*70^(1/2)*z^4-1/4*70^(1/2)*z^2+1/16*70^(1/2)
        return(y)
      }
    }
    else if (k==9) {
      h<-function(x){
        z<-(x-mu)/sigma
        y<-1/5040*35^(1/2)*2^(1/2)*z^9-1/140*35^(1/2)*2^(1/2)*z^7+3/40*35^(1/2)*2^(1/2)*z^5-1/4*35^(1/2)*2^(1/2)*z^3+3/16*35^(1/2)*2^(1/2)*z
        return(y)
      }
    }
    else if (k==10) {
      h<-function(x){
        z<-(x-mu)/sigma
        y<-1/5040*7^(1/2)*z^10-1/112*7^(1/2)*z^8+1/8*7^(1/2)*z^6-5/8*7^(1/2)*z^4+15/16*7^(1/2)*z^2-3/16*7^(1/2)
        return(y)
      }
    }
    return(h)
  }
