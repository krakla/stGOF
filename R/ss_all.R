#Function returns all score statistics within the horizon S
ss_all <-
  function(data,S,min.order,distr,method) {
    max.order<-max(unlist(S))
    st<-stGOFD(data,order=max.order,B=NULL,output=F,distr=distr,method=method)
    Sigma<-st$Sigma
    U<-matrix(st$comp,ncol=1)
    theta<-U/sqrt(length(data))
    stats<-rep(NA,length(S))
    for(i in 1:length(S)) {
      ind<-S[[i]]-min.order+1
      temp<-try(t(U[ind])%*%solve(Sigma[ind,ind])%*%U[ind],silent=TRUE)
      if (!inherits(temp,"try-error")) {
        stats[i]<-temp
      }
      else {
        stats[i]<-NA
      }
    }
    return(list(stats=stats,theta=theta))
  }

