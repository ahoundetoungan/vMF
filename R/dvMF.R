#' @title  PDF of the von Mises - Fisher distribution.
#' 
#' @description \code{dvMF} computes the density of the von Mises - Fisher distribution, given a set of spherical coordinates and the distribution parameters.
#'
#' @details  The probability density function of the von Mises - Fisher distribution is defined by :
#' \deqn{f(z|theta) = C_p(|theta|)\exp{(z theta)}}
#' \eqn{|theta|} is the intensity parameter and \eqn{\frac{theta}{|theta|}} the mean directional parameter. The normalization constant \eqn{C_p()} depends 
#' on the Bessel function of the first kind. See more details \href{http://en.wikipedia.com/wiki/Von_Mises-Fisher_distribution}{here}.
#' 
#' @param z as the set of points at which the spherical coordinate will be evaluated. z may be an one row matrix or vector if it contain one spherical coordinates or a
#' matrix whose each row is one spherical coordinates.
#' @param theta as the distribution parameter.
#' @return the densities computed at each point 
#' @examples
#' # Draw 1000 vectors from vM-F with parameter 1, (1,0)
#' z <- rvMF(1000,c(1,0))
#' 
#' # Compute the density at these points
#' dvMF(z,c(1,0))
#' 
#' # Density of (0,1,0,0) with the parameter 3, (0,1,0,0)
#' dvMF(c(0,1,0,0),c(0,3,0,0)) 
#' @author 
#' Aristide Houndetoungan <\email{ariel92and@@gmail.com}>
#' @keywords 
#' distribution, directional statistics, coordinates
#' @seealso 
#' \code{rvMF} and \code{\link{CpvMF}} 
#' 
#' @references  
#' Wood, A. T. (1994). Simulation of the von Mises Fisher distribution. Communications in statistics-simulation and computation, 23(1), 157-164.
#' 
#' @export


dvMF <- function(z, theta){
  if(class(z) == "numeric") z <- matrix(z,nrow = 1)
  return(as.vector(cppdvMF(z,theta)))
}