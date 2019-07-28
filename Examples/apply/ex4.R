library(parallel)

#RNGkind("L'Ecuyer-CMRG")
cores<-strtoi(Sys.getenv('SLURM_CPUS_PER_TASK', unset=1))
nstarts=20

source('spin.R')

data<-matrix(rnorm(1000000), ncol=1000)

f<-function(i) {
  spin(3)
  i*sum(data)
}

system.time({
results <- mclapply(1:nstarts, f, mc.cores=cores)
})

print(Reduce('+', results))
