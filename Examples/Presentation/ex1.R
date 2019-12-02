# This s a simple example of using foreach

library(foreach)
library(doMC)

nstarts=20

source('spin.R')

f<-function(k) {
spin(10)
k*k
}

cores<-strtoi(Sys.getenv('SLURM_CPUS_PER_TASK', unset=1))
registerDoMC(cores)

system.time({
results <- foreach(trial=1:nstarts) %dopar% {
  f(trial)
}
})

print(results)
