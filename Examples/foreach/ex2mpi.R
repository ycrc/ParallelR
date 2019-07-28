library(foreach)
library(doMPI)

workers<-strtoi(Sys.getenv('SLURM_NTASKS', unset=1))-1
cl=startMPIcluster(count=workers)
registerDoMPI(cl)

#RNGkind("L'Ecuyer-CMRG")
nstarts=20

source('spin.R')

f<-function(k) {
  spin(3)
  runif(10)
}

registerDoMPI(cl)

system.time({
results <- foreach(trial=1:nstarts) %dopar% {
  f(trial)
}
})

print(results)
