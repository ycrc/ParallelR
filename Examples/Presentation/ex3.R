library(parallel)

cores<-strtoi(Sys.getenv('SLURM_CPUS_PER_TASK', unset=1))
nstarts=20

source('spin.R')

f<-function(i) {
  spin(1)
  i*i
}

system.time({
results <- mclapply(1:nstarts, f, mc.cores=cores)
})

print(Reduce('+', results))
