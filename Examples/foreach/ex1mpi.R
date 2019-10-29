library(foreach)
library(doMPI)

# don't do this! Master process sees n, others see random stuff, and it fails (!)
#workers<-strtoi(Sys.getenv('SLURM_NTASKS', unset=1))-1

# this works, but isn't needed.   
#workers<-mpi.universe.size()-1
#cl=startMPIcluster(count=workers, verbose=TRUE, logdir="log")

# better to let startMPIcluster figure it out itself
cl=startMPIcluster(verbose=TRUE, logdir="log")
registerDoMPI(cl)

RNGkind("L'Ecuyer-CMRG")
nstarts=20

source('spin.R')

f<-function(k) {
spin(10)
k*k
}

system.time({
results <- foreach(trial=1:nstarts) %dopar% {
  f(trial)
}
})

print(results)

# This is important, or job won't finish
closeCluster(cl)
mpi.quit()
