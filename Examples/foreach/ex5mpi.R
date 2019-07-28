# this example works EXCEPT that closeCluster doesn't appear to stop the cluster cleanly, and 
# slurm show exit code of 1

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


