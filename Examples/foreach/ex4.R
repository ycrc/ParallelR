library(foreach)
library(doMC)

#RNGkind("L'Ecuyer-CMRG")
cores<-strtoi(Sys.getenv('SLURM_CPUS_PER_TASK', unset=1))
nstarts=20

source('spin.R')

data<-matrix(rnorm(1000000), ncol=1000)

f<-function(i) {
  spin(3)
  i*sum(data)
}

registerDoMC(cores)

system.time({
results <- foreach(trial=1:nstarts, .combine='+') %dopar% {
  f(trial)
}
})

print(results)
