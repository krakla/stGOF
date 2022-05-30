#'  Pseudo-Random Generator Data - PRG data
#'
#' The generation of random numbers is important in many areas. For instance,
#' in modern cryptographic algorithms 'good' random numbers are needed.
#' Good random number generators are also essential in many sciences, e.g.,
#' in physics and, of course, in statistics, where it is common practice today
#' to assess empirically the validity of theoretical distribution theory by means
#' of a simulation experiment in which statistics are calculated on repeatedly
#' generated random samples from a given distribution.
#' A device that generates true random numbers is hard to achieve. A true
#' random generator is, for instance, based on a radioactive source, but it is
#' unrealistic to have this built into every computer. Therefore, computer scientists,
#' mathematicians, and engineers have created algorithms that generate
#' pseudo-random numbers. These algorithms are based on a sound mathematical theory,
#' and despite their deterministic nature they generate sequences
#' of numbers that come close to true random number sequences. Apart from
#' having as much randomness in the sequence as possible, pseudo-random generators
#' 'sample' the numbers from a particular distribution. Often this is the
#' uniform distribution over [0, 1]. Whenever a new pseudo-random generator is
#' developed, it should be tested. Using the terminology of Knuth (1969), two
#' types of tests exist: theoretical and empirical tests. The former are based on
#' algorithmic properties and their application does not need to let the algorithm
#' generate sequences of pseudo-random numbers. The result of the test
#' is a score of the randomness. The empirical tests, on the other hand, are basically
#' statistical goodness-of-fit tests that should be applied to a generated
#' sequence. These tests are used to test the null hypothesis that the generated
#' numbers are indeed sampled from a uniform distribution over [0, 1]. Atkinson (1980)
#' is a reference in the statistical literature describing the problem.
#' A nice reference in the computer science literature in which goodness-of-fit
#' tests are applied to several pseudo-random generators, is Entacher and Leeb(1995).

#'
#' @format a vector with 100000 records
#'
#' @source Atkinson. Tests of pseudo-random numbers. Applied Statistics, 29:164–171, 1980.
#'
#' @example
#' data(PRG)
"PRG"
