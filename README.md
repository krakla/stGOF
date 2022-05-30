# stGOF R package
The stGOF is designed to Performs the smooth test for the one-sample goodness-of-fit 
problem as described by Rayner et al.(2009). Both simple and composite null hypotheses 
can be tested. The maximum likelihood (MLE) and the method of moments (MME) methods 
for nuisance parameter estimation are implemented. Function returns the score statistics 
of Smooth test result.
The goal of stGOF package is to return the smooth test result as descriped in 
Smooth Tests of Goodness of Fit Using R book by D. John Best, J. C. W. Rayner,
and Olivier Thas.smooth tests and data-driven smooth tests of goodness of fit 
can be performed for several distributions. The package also contains functions
for the construction of sets of orthonormal polynomials.

## Installation

You can install the development version of stGOF from [GitHub](https://github.com/krakla/stGOF) with:

`install.packages("devtools")`

`devtools::install_github("krakla/stGOF")`


## Example

This is a basic example which shows you how to calculate smooth test PCB data
 which follows the normal distribution and using MLE as an estimation method

`library(stGOF)`
`stGOF(PRG ~ unif, PRG, order = 4, method = "MLE")`

In addition, there are several functions to calculate the MLE, MME estimators.
Also, there are functions can be used to construct of sets of orthonormal 
polynomials. For example, here is the MLE estimator for pulse data.

`norm.MLE(pulse)`

#### Other examples 
`stGOF(PCB ~ norm, PCB, order = 4, method = "MLE")`

`stGOF(PCB ~ norm, PCB, order = 5, method = "MLE", B = 1000, rescale = T)`

`stGOF(PCB ~ norm, PCB, method = "MLE", B = 1000, max.order = 7, horizon="order", criterion="AIC")`

`stGOF(PCB ~ norm, PCB, method = "MME", B = 1000, max.order = 7, horizon="subset", criterion="BIC")`

`stGOF(pulse ~ pois, PCB, method = "MME", B = 1000, max.order = 8, horizon="subset", criterion="BIC")`
