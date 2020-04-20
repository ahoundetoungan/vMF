#' @title Sample from von Mises - Fisher distribution
#'
#' @description vMF samples from von Mises-Fisher distribution and performs some operations. 
#' Unlike the \href{https://cran.r-project.org/package=movMF}{movMF} package, vMF does not consider mixtures of von Mises-Fisher distrubution.
#' vFM particulary focuses on sampling from the distribution and performs it very quickly. This is useful to carry out fastly simulations in directional statistics.
#' vMF also computes the density and normalization constant of the von Mises-Fisher distribution. 
#' 
#' 
#' @docType package
#' @name vMF
#' @author 
#' Aristide Houndetoungan <\email{ariel92and@@gmail.com}>
#'   
#' @note 
#' Advanced examples of using vMF are available \href{https://houndetoungan.wixsite.com/aristide/fast-sampling-from-vmf-distribution}{online}.
#'   
#' @references 
#' Wood, A. T. (1994). Simulation of the von Mises Fisher distribution. Communications in statistics-simulation and computation, 23(1), 157-164.
NULL