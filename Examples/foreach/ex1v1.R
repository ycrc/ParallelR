library(foreach)
library(doMC)

RNGkind("L'Ecuyer-CMRG")
cores<-strtoi(Sys.getenv('SLURM_CPUS_PER_TASK', unset=1))
nstarts=20

source('spin.R')

f<-function(k) {
spin(10)
k*k
}

`%mypar%` <- `%dopar%`
registerDoMC(cores)

system.time({
results <- foreach(trial=1:nstarts) %mypar% {
  f(trial)
}
})

print(results)
