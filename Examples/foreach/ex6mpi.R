# this example doesn't work 

library(foreach)
library(doMPI)

cl=startMPIcluster()
registerDoMPI(cl)

nstarts=20

source('spin.R')


f<-function(i) {
  spin(i)
  ret<-i*sum(data)
  c(ret, ls.str(environment()))
}

data<-matrix(rnorm(1000000), ncol=1000)

system.time({
results <- foreach(trial=1:nstarts) %dopar% {
  f(trial)
}
})

closeCluster(cl)
print(results)


