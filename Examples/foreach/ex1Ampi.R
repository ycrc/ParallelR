library(foreach)
library(doMPI)

workers<-strtoi(Sys.getenv('SLURM_NTASKS', unset=1))-1
cl=startMPIcluster(count=workers)
registerDoMPI(cl)

RNGkind("L'Ecuyer-CMRG")
nstarts=20

source('spin.R')

# Replace hard spin with sleep, so show that idle mpi procs (in this case the master) spin hard.

f<-function(k) {
Sys.sleep(10)
k*k
}

registerDoMPI(cl)

system.time({
results <- foreach(trial=1:nstarts) %dopar% {
  f(trial)
}
})

print(results)

#closeCluster appears to be hanging now
#closeCluster(cl)
#mpi.quit()
