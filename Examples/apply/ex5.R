library(parallel)

#RNGkind("L'Ecuyer-CMRG")
cores<-strtoi(Sys.getenv('SLURM_CPUS_PER_TASK', unset=1))
nstarts=20

source('spin.R')

data<-matrix(rnorm(1000000), ncol=1000)

cl<-makeCluster(cores, type="FORK")

f<-function(i) {
  spin(3)
  i*sum(data)
}

system.time({
results <- clusterApply(cl, 1:nstarts, f)
})

print(Reduce('+', results))
