# This example illustrates the foreach environment

library(foreach)
library(doMPI)

# here, before the registerDoMPI, all workers will see the library, so .packages isn't needed
# library(randomForest)

cl=startMPIcluster(verbose=TRUE, logdir="log")
registerDoMPI(cl)

x <- matrix(runif(500), 100)
y <- gl(2, 50)

# only the master runs this code
library(randomForest)

# alternatively, use .packages to force the workers to load randomForest
# .export isn't really needed, because foreach will do this automatically in this case
system.time({
rf <- foreach(ntree=rep(250, 4), .combine=combine, .export=c('x', 'y'), .packages='randomForest') %dopar%
   randomForest(x, y, ntree=ntree)
})

print(rf)

# This is important, or job won't finish
closeCluster(cl)
mpi.quit()
