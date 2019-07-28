
library(foreach)
library(MASS)
library(doMPI)

RNGkind("L'Ecuyer-CMRG")
starts=10 #100000
workers=3
tasks=workers
nstarts=rep(starts/tasks, tasks)

f<-function(nstart) kmeans(Boston, 4, nstart=nstart)

cl=startMPIcluster(count=workers)
registerDoMPI(cl)

system.time({
results <- foreach(trial=1:nstarts) %dopar% {
  f(trial)
}
})

i = sapply(results, function(result) result$tot.withinss)
print(i)
result = results[[which.min(i)]]
print(result)
~                                                                                                                                                                                 

