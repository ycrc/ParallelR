# This example illustrates foreach providing referenced variables, but
# not libraries

library(foreach)
library(doMC)
library(randomForest)

cores<-strtoi(Sys.getenv('SLURM_CPUS_PER_TASK', unset=1))
registerDoMC(cores)

x <- matrix(runif(500), 100)
y <- gl(2, 50)

system.time({
rf <- foreach(ntree=rep(250, 4), .combine=combine) %dopar%
   randomForest(x, y, ntree=ntree)
})

print(rf)
