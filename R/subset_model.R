# Function return the model results when using 'subset' as a horizon in the data-driven bootstrap function
subset_model <-
  function(k) {
    models<-list()
    for (mod.length in 1:k) {
      mod.extra<-combn(k,mod.length,simplify=F)
      for (i in 1:choose(k,mod.length)) {
        models[[length(models)+1]]<-mod.extra[[i]]
      }
    }
    return(models)
  }
