library(foreach)
library(doMPI)

print(Sys.getenv('SLURM_NTASKS'))

workers<-strtoi(Sys.getenv('SLURM_NTASKS', unset=1))-1

print(workers)

#closeCluster appears to be hanging now
mpi.quit()
