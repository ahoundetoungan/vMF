// [[Rcpp::depends(RcppArmadillo, BH)]]
#include <RcppArmadillo.h>
#include <boost/math/special_functions/bessel.hpp>

using namespace Rcpp;
using namespace arma;
using namespace std;

// FOR SAMPLING von Mises Fisher Distribution 


// function computes the W following :
// Andrew T.A Wood (1994) Simulation of the von mises fisher distribution, 
// Communications in Statistics - Simulation and Computation

void rw(const int& n, const double& lambda, int& m, NumericVector& W){
  // Step 0
  double d=m-1;
  double b = d/ (sqrt(4. * lambda * lambda + d*d) + 2. * lambda);
  double x = (1. - b) / (1. + b);
  double c = lambda * x + d * log(1. - x * x);
  
  // Step 1
  // Let's declare the variables we will use
  double w, Z, U;   // distinguish w from W. W is a vector of w
  
  // Start the loop
  for(int i(0);i<n;++i){
    Step1: Z = (rbeta(1,d/2.,d/2.))(0);
    w = (1.-(1.+b)*Z)/(1.-(1.-b)*Z);
    U = (runif(1,0.,1.))(0);
    
    /*step 2*/
    if(lambda*w+(m-1)*log(1-x*w)-c < log(U)){goto Step1;}
    W(i)=w;
  }
}


// This program sample von Mises Fisher distribution 
// [[Rcpp::export]]
mat rvMF(const int& size,const vec& theta){
  int p=theta.n_rows;            //hypersphere dimension
  double lambda=norm(theta);     //intensity parameter
  mat X;                         //Output matrix
  
  // if lambda=0 sample uniform; that is normal/norm
  if(lambda==0){
    NumericMatrix Xtemp(size,p,rnorm(size*p).begin());
    X=normalise(as<mat>(Xtemp),2,1);  //nomalize rows by their norm   
  }
  else{
    double d=p-1;
    // Compute W
    vec W(size);        //Void W
    rw(size, lambda, d, W);   //Fill W using rw
    mat Wplus=repmat(W,1,d);  //Reshape to [W W W ... W] of dimension (n,d)
    //mean direction parameter
    vec mu=theta/lambda;           
    // Necessary variables declaration
    NumericMatrix Vtemp(size,d,rnorm(size*d).begin());
    mat V=normalise(as<mat>(Vtemp),2,1);
    mat X1=sqrt(1-Wplus % Wplus) % V;
    X=join_rows(X1,W);
    //Rotation
    // To get samples from a vMF distribution with arbitrary mean direction
    // parameter µ, X is multiplied from the right with a matrix where the
    // first (m − 1) columns consist of unitary basis vectors of
    // the subspace orthogonal to µ and the last column is equal to µ. See
    // Hornik, K., & Grün, B. (2014). movMF: An R package for fitting mixtures
    // of von Mises-Fisher distributions. Journal of Statistical Software, 
    // 58(10), 1-31.
    mat Q,R;
    qr(Q, R, mu);    //QR decomposition to get subsâce orthogonal to µ
    IntegerVector seqcol=seq_len(d);
    Q=Q.cols(as<uvec>(seqcol));
    Q=join_rows(Q,mu);
    X=X*Q.t();
  }
  return X;
}


// The normalization constant which depends on modified Bessel function
// in von Mises-Fisher distribution

// [[Rcpp::export]]

double CpvMF(const int& p, const double& k){
  if(k==0){ /*If k=0 return 1*/  return 1;}
  NumericVector temp=gamma(NumericVector::create(p/2.));
  return pow(k/2.,(p/2.)-1.)/(temp(0)*boost::math::cyl_bessel_i((p/2.)-1.,k));
}

// Compute the von Mises-Fisher density
// [[Rcpp::export]]

arma::vec dvMF(arma::mat& z, arma::vec& theta){
  int Nrow=theta.n_rows, Ncol=theta.n_cols;
  if(Ncol>Nrow){
    theta=theta.t();                //to be sure that theta is a column
  }
  return CpvMF(z.n_cols,arma::norm(theta))*exp(z*theta);
