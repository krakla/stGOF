stGOF Package
================

## GitHub Documents

The `stGOF` is designed to Performs the smooth test for the one-sample
goodness-of-fit problem as described by *Rayner et al*.(2009). Both
simple and composite null hypotheses can be tested. The maximum
likelihood (`MLE`) and the method of moments (`MME`) methods for
nuisance parameter estimation are implemented. Function returns the
score statistics of Smooth test result.

The goal of `stGOF` package is to return the smooth test result as
descriped in ***“Smooth Tests of Goodness of Fit Using R”*** book by D.
*John Best, J. C. W. Rayner, and Olivier Thas*.smooth tests and
data-driven smooth tests of goodness of fit can be performed for several
distributions. The package also contains functions for the construction
of sets of orthonormal polynomials.

## Installation

You can install the development version of stGOF from
[GitHub](https://github.com/krakla/stGOF) with:

`install.packages("devtools")`

`devtools::install_github("krakla/stGOF")`

## Including Plots

You can also embed plots, for example:

## Example

This is a basic example which shows you how to calculate smooth test PCB
data which follows the normal distribution and using MLE as an
estimation method

``` r
library(stGOF)
stGOF(PRG ~ unif, PRG, order = 4, method = "MLE")
```

    ##        Results of the Smooth test
    ##        Ho: Uniform against 4 th order alternative
    ##        Parameter estimation method: MLE 
    ##        Parameter estimates: 2.463115e-06 0.9999763  ( min max )
    ## 
    ## 
    ##     All p-values are obtained by the asymptotical chi-square approximation 
    ## 
    ##     Smooth test statistic S_k : 4.2645 
    ##                p-value        : 1 
    ## 
    ##      1 th theoretically rescaled component V_k ==> -1.01504  p-value ==> 0.31009 
    ##      2 th theoretically rescaled component V_k ==> -0.30575  p-value ==> 0.75979 
    ##      3 th theoretically rescaled component V_k ==> -1.42447  p-value ==> 0.36256 
    ##      4 th theoretically rescaled component V_k ==> -1.05431  p-value ==> 0.29174

In addition, there are several functions to calculate the MLE, MME
estimators. Also, there are functions can be used to construct of sets
of orthonormal polynomials. For example, here is the MLE estimator for
pulse data.

`norm.MLE(pulse)`

#### Other examples

``` r
stGOF(PCB ~ norm, PCB, order = 4, method = "MLE")
```

    ##        Results of the Smooth test
    ##        Ho: Normal against 4 th order alternative
    ##        Parameter estimation method: MLE 
    ##        Parameter estimates: 210 72.26383  ( mean sd )
    ## 
    ## 
    ##     All p-values are obtained by the asymptotical chi-square approximation 
    ## 
    ##     Smooth test statistic S_k : 9.5588 
    ##                p-value        : 0.0084 
    ## 
    ##      3 th theoretically rescaled component V_k ==> 2.33172  p-value ==> 0.01972 
    ##      4 th theoretically rescaled component V_k ==> 2.03024  p-value ==> 0.04233

``` r
stGOF(PCB ~ norm, PCB, order = 5, method = "MLE", B = 1000, rescale = T)
```

    ##        Results of the Smooth test
    ##        Ho: Normal against 5 th order alternative
    ##        Parameter estimation method: MLE 
    ##        Parameter estimates: 210 72.26383  ( mean sd )
    ## 
    ## 
    ##     All p-values are obtained by the bootstrap with 1000 runs
    ## 
    ## 
    ##     Smooth test statistic S_k : 9.7475 
    ##                p-value        : 0.022 
    ## 
    ##      3 th empirically rescaled component V_k ==> 1.49321  p-value ==> 0.144 
    ##      4 th empirically rescaled component V_k ==> 1.21281  p-value ==> 0.088 
    ##      5 th empirically rescaled component V_k ==> 0.35025  p-value ==> 0.738

``` r
stGOF(PCB ~ norm, PCB, method = "MLE", B = 1000, max.order = 7, horizon="order", criterion="AIC")
```

    ##        Result for Data-Driven Smooth goodness-of-fit test
    ##        Null hypothesis: norm against 7 th order alternative
    ##        Parameter estimation method: MLE 
    ##        Parameter estimates: 210 72.26383  ( mean sd )
    ## 
    ##        Horizon: order 
    ##        Selection criterion: AIC 
    ## 
    ##      All p-values are obtained by the bootstrap with 1000 runs
    ## 
    ##    Data-Driven Smooth test statistic S_k ==> 9.5588 p-value ==> 0.023 
    ##     Selected model: 3 4

``` r
stGOF(PCB ~ norm, PCB, method = "MME", B = 1000, max.order = 7, horizon="subset", criterion="BIC")
```

    ##        Result for Data-Driven Smooth goodness-of-fit test
    ##        Null hypothesis: norm against 7 th order alternative
    ##        Parameter estimation method: MME 
    ##        Parameter estimates: 210 72.26383  ( mean sd )
    ## 
    ##        Horizon: subset 
    ##        Selection criterion: BIC 
    ## 
    ##      All p-values are obtained by the bootstrap with 1000 runs
    ## 
    ##    Data-Driven Smooth test statistic S_k ==> 5.43692 p-value ==> 0.041 
    ##     Selected model: 3

``` r
stGOF(pulse ~ pois, PCB, method = "MME", B = 1000, max.order = 8, horizon="subset", criterion="BIC")
```

    ##        Result for Data-Driven Smooth goodness-of-fit test
    ##        Null hypothesis: pois against 8 th order alternative
    ##        Parameter estimation method: MME 
    ##        Parameter estimates: 210  ( lambda )
    ## 
    ##        Horizon: subset 
    ##        Selection criterion: BIC 
    ## 
    ##      All p-values are obtained by the bootstrap with 1000 runs
    ## 
    ##    Data-Driven Smooth test statistic S_k ==> 1.296961e+13 p-value ==> 0 
    ##     Selected model: 2 3 4 5 6 7 8
