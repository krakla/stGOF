#Function returns the test statistics
test.stat <- function (order, distr = "", data, method = ""){
  {
    inital.res <- prepare.fun(distr, data, method)
    pars <- switch(distr,
                   norm = inital.res[3:4],
                   exp = inital.res[3],
                   pois = inital.res[3],
                   unif = inital.res[3:4],
                   logis = inital.res[3:4])
    n <- inital.res[1]
    q <- inital.res[2] - 1
  }
  if(distr=="unif"&&method=="MLE"){
    C <- diag(rep(1, order))

    U <- rep(0, order)
    EVar<-NA
    MIN <- pars[1]
    MAX <- pars[2]
    for (i in 1:order) {
      h <- orth_poly(i, distr = distr, pars = c(MIN, MAX))
      U[i] <- sum(h(data))/sqrt(n)
    }
    comp <- U
    dim(U) <- c(order, 1)
    Tstat <- t(U) %*% solve(C) %*% U
    Tstat <- c(U/sqrt(diag(C)), Tstat)
  }
  else if(distr=="unif"&&method=="MME"){
    a <- 0
    b <- 1
    f <- function(x) {
      y <- dunif(x, min=a, max=b)
      invisible(y)
    }
    S1 <- function(x) {
      y <- 1/(b-a)
      invisible(y)
    }
    S2 <- function(x) {
      y <- -1/(b-a)
      invisible(y)
    }
    A1 <- rep(0, order)
    A2 <- rep(0, order)
    for (i in 1:order) {
      h <- orth_poly(i, distr = "unif", pars = c(a,b))
      g <- function(x) {
        y <- h(x) * S1(x) * f(x)
        y[is.nan(y)] <- 0
        invisible(y)
      }
      templist <- integrate(g, a, b)
      A1[i] <- templist$value - h(a)*f(a)
      g <- function(x) {
        y <- h(x) * S2(x) * f(x)
        y[is.nan(y)] <- 0
        invisible(y)
      }
      templist <- integrate(g, a, b)
      A2[i] <- templist$value + h(b)*f(b)
    }

    var.unif2<-function(r,z,sigma) {
      n<-length(z)
      Eh.Da<-switch(r-2,
                    mean(h3.Da.unif2(z,sigma)),
                    mean(h4.Da.unif2(z,sigma)),
                    mean(h5.Da.unif2(z,sigma)),
                    mean(h6.Da.unif2(z,sigma)),
                    mean(h7.Da.unif2(z,sigma)),
                    mean(h8.Da.unif2(z,sigma)))
      Eh.Db<-switch(r-2,
                    mean(h3.Db.unif2(z,sigma)),
                    mean(h4.Db.unif2(z,sigma)),
                    mean(h5.Db.unif2(z,sigma)),
                    mean(h6.Db.unif2(z,sigma)),
                    mean(h7.Db.unif2(z,sigma)),
                    mean(h8.Db.unif2(z,sigma)))
      v<-mean((g_r.unif2(r,z,sigma,Eh.Da,Eh.Db))^2)-(mean(g_r.unif2(r,z,sigma,Eh.Da,Eh.Db)))^2
      v<-v*n/(n-1)
      return(v)
    }

    g_r.unif2<-function(r,z,sigma,Eh.Da,Eh.Db) {
      h<-orth_poly(r,"unif",c(0,1))
      tmp<-h(z)+b.a.unif2(z,sigma)*Eh.Da+b.b.unif2(z,sigma)*Eh.Db
      return(tmp)
    }

    b.a.unif2<-function(z,sigma) {sigma*(4*z-1-3*z^2)}
    b.b.unif2<-function(z,sigma) {sigma*(-2*z+3*z^2)}

    h3.Da.unif2<-function(z,sigma) {-(7^(1/2)*(12-60*z+60*z^2))*(1-z)/sigma}
    h3.Db.unif2<-function(z,sigma) {-(7^(1/2)*(12-60*z+60*z^2))*z/sigma}

    h4.Da.unif2<-function(z,sigma) {-(-60+540*z-1260*z^2+840*z^3)*(1-z)/sigma}
    h4.Db.unif2<-function(z,sigma) {-(-60+540*z-1260*z^2+840*z^3)*z/sigma}

    h5.Da.unif2<-function(z,sigma) {-(11^(1/2)*(30-420*z+1680*z^2-2520*z^3+1260*z^4))*(1-z)/sigma}
    h5.Db.unif2<-function(z,sigma) {-(11^(1/2)*(30-420*z+1680*z^2-2520*z^3+1260*z^4))*z/sigma}

    h6.Da.unif2<-function(z,sigma) {-(13^(1/2)*(-42+840*z-5040*z^2+12600*z^3-13860*z^4+5544*z^5))*(1-z)/sigma}
    h6.Db.unif2<-function(z,sigma) {-(13^(1/2)*(-42+840*z-5040*z^2+12600*z^3-13860*z^4+5544*z^5))*z/sigma}

    h7.Da.unif2<-function(z,sigma) {-(15^(1/2)*(56-1512*z+12600*z^2-46200*z^3+83160*z^4-72072*z^5+24024*z^6))*(1-z)/sigma}
    h7.Db.unif2<-function(z,sigma) {-(15^(1/2)*(56-1512*z+12600*z^2-46200*z^3+83160*z^4-72072*z^5+24024*z^6))*z/sigma}

    h8.Da.unif2<-function(z,sigma) {-(17^(1/2)*(-72+2520*z-27720*z^2+138600*z^3-360360*z^4+504504*z^5-360360*z^6+102960*z^7))*(1-z)/sigma}
    h8.Db.unif2<-function(z,sigma) {-(17^(1/2)*(-72+2520*z-27720*z^2+138600*z^3-360360*z^4+504504*z^5-360360*z^6+102960*z^7))*z/sigma}


    NVE.unif<-function(sample,order,parest=NA){
      if (order<9 && order>2) {
        n<-length(sample)
        if (is.na(parest[1])) {
          tmp<-unif.MME(sample)
          a<-tmp[1]
          b<-tmp[2]
        }
        else {
          a<-parest[1]
          b<-parest[2]
        }
        sigma<-b-a
        z<-(sample-a)/sigma
        var_est<-var.unif2(order,z,sigma)
      }
      else {var_est<-NA}
      return(var_est)
    }



    A <- cbind(A1, A2)
    I <- diag(rep(1, order - 2))
    K <- A[3:order, ] %*% solve(A[1:2, ])
    C <- I + K %*% t(K)

    U <- rep(0, order - 2)
    EVar <- U
    MIN <- pars[1]
    MAX <- pars[2]
    for (i in 3:order) {
      h <- orth_poly(i, distr = distr, pars = c(MIN, MAX))
      U[i - 2] <- sum(h(data))/sqrt(n)
      EVar[i-2]<-NVE.unif(data,order=i,parest=c(MIN, MAX))
    }
    comp <- U
    dim(U) <- c(order - 2, 1)
    Tstat <- t(U) %*% solve(C) %*% U
    Tstat <- c(U/sqrt(diag(C)), Tstat)
  }
  else if(distr=="logis"&&method=="MME"){
    C <- diag(rep(1, order-q))

    U <- rep(0, order-q)
    EVar<-NA
    MU <- pars[1]
    SIGMA <- pars[2]
    for (i in (q + 1):order) {
      h <- orth_poly(i, distr = distr, pars = c(MU, SIGMA))
      U[i-q] <- sum(h(data))/sqrt(n)
    }
    comp <- U
    dim(U) <- c(order-q, 1)
    Tstat <- t(U) %*% solve(C) %*% U
    Tstat <- c(U/sqrt(diag(C)), Tstat)
  }
  else{
    C <- diag(rep(1, order - q))

    U <- rep(0, order - q)
    EVar<-U
    for (i in (q + 1):order) {
      h <- orth_poly(i, distr, pars, method)
      U[i - q] <- sum(h(data))/sqrt(n)
      EVar[i-q]<-var(h(data))
    }
    comp <- U
    dim(U) <- c(order - q, 1)
    Tstat <- t(U) %*% solve(C) %*% U
    Tstat <- c(U/sqrt(diag(C)), Tstat)
  }

  invisible(list(Tstat = Tstat, comp = comp, Sigma=C, EVar=EVar))
}
