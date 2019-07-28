
library(foreach)
library(MASS)
library(doMC)

RNGkind("L'Ecuyer-CMRG")
starts=10 #100000
cores=4
tasks=cores
nstarts=rep(starts/tasks, tasks)

f<-function(nstart) kmeans(Boston, 4, nstart=nstart)

registerDoMC(cores)

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

