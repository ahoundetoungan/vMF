# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

cpprvMF <- function(size, theta) {
    .Call(`_vMF_cpprvMF`, size, theta)
}

logCpvMFcpp <- function(p, k) {
    .Call(`_vMF_logCpvMFcpp`, p, k)
}

dvMFcpp <- function(z, theta, logp = FALSE) {
    .Call(`_vMF_dvMFcpp`, z, theta, logp)
}

