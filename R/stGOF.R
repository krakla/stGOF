stGOF<-function(formula,data=NA,order=NULL,method = "MLE",rescale = FALSE,B = NULL,
                  max.order=0,horizon="",criterion="",output=TRUE)
{
  #Prepare
  distr<-as.character(attr(terms(formula),"variables")[[3]])
  method<-toupper(method)
  distr<-tolower(distr)
  distr_name<-switch(distr,
                       norm = "Normal",
                       exp = "Exponential",
                       pois = "Poisson",
                       unif = "Uniform",
                       logis = "Logistic")
  #Regular function
  if(!is.null(order)&&!(rescale)){
    stGOF_R(data=data,distr=distr,order=order,method=method)
    }
  #bootstrap
  else if(rescale){
    stGOF_B(data=data,distr=distr,order=order,method=method,B=B)

  }
  #Data-Driven bootstrap
  else{
    stGOF_DD(data=data,distr=distr,max.order=max.order,
         horizon=horizon,criterion=criterion,method=method,B=B)
    }
}
