### Example 1
library(vMF)
library(movMF)
library(microbenchmark) #For comparing elapsed time

TIME1 <- microbenchmark("vMF1" = rvMF(1,c(1,0,0)), "movMF1" = rmovMF(1,c(1,0,0)),
                        "vMF2" = rvMF(100,c(1,0,0)), "movMF2" = rmovMF(100,c(1,0,0)),
                        "vMF3" = rvMF(1000,c(1,0,0)), "movMF3" = rmovMF(1000,c(1,0,0)))
print(TIME1)

### Example 2
# Fonction based on vMF to simulate theta
SamplevMF          <-function(n, initial) {
  output           <-matrix(NaN, n + 1, length(initial))
  output[1, ]      <-t(initial)
  for (i in 1:n) {
    output[i + 1,] <-rvMF(1, output[i,])
  }
  return(output)
}

# Fonction based on movMF to simulate theta
SamplemovMF        <-function(n,initial){
  output           <-matrix(NaN, n + 1, length(initial))
  output[1, ]      <-initial
  for (i in 1:n) {
    output[i + 1,] <-rmovMF(1,output[i,])
  }
  return(output)
}
TIME2 <-  microbenchmark("vMF" = SamplevMF(1000,c(0,0,0,0)), 
                         "movMF" = SamplemovMF(1000,c(0,0,0,0)))
print(TIME2)