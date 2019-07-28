
library(snow)
library(Rmpi)
cl<-makeCluster(3, type="MPI")
clusterEvalQ(cl, library(MASS))
r<-clusterApply(cl, rep(5,5), function(n) kmeans(Boston, 4, nstart=n))
r
