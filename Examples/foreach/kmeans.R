library(MASS)
library(foreach)
library(doMC)

RNGkind("L'Ecuyer-CMRG")
cores<-strtoi(Sys.getenv('SLURM_CPUS_PER_TASK', unset=1))
print(cores)
registerDoMC(cores)

starts=100000
tasks=cores*10
nstarts=rep(starts/tasks, tasks)
clusters=seq(2,5)

print(c("tasks", tasks, "nstarts", nstarts, "clusters", clusters))

system.time({
results <- 
  foreach (nstart=nstarts) %:%
    foreach (cluster=clusters) %dopar% {
  kmeans(Boston, cluster, nstart=nstart)
}})

results <- unlist(results, recursive=FALSE)
i = sapply(results, function(result) result$tot.withinss)
result = results[[which.min(i)]]
print(result)

