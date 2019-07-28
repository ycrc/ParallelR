#https://sph.umich.edu/biostat/computing/cluster/examples/r.html

library(Rmpi)
library(snow)

#RNGkind("L'Ecuyer-CMRG")
nstarts=20

source('spin.R')

print("A")

#data<-matrix(rnorm(1000000), ncol=1000)

# don't do this! Master process sees n, others see n-1 (!)
#workers<-strtoi(Sys.getenv('SLURM_NTASKS', unset=1))-1

#workers<-mpi.universe.size()-1

print("B")
cl<-makeMPIcluster(3)

print("C")
#clusterExport(cl, "spin")

print("D")
#this didn't define spin on workers
#clusterEvalQ(cl, 'source("spin.R")')

f<-function(i) {
  #spin(i)
  i*i
}

print("E")
system.time({
results <- clusterApply(cl, 1:nstarts, f)
})

print("F")
system.time({
results <- clusterApplyLB(cl, 1:nstarts, f)
})

print("G")
system.time({
results <- clusterApplyLB(cl, nstarts:1, f)
})

print("H")
print(Reduce('+', results))
print('all done')

#  stopCluster hangs!
#stopCluster(cl)

