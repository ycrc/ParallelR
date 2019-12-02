
extract<-function(fn) {
  load(fn)
  res
}

fns = Sys.glob("Result*.RData")
results = lapply(fns, extract)
i = sapply(results, function(res) res$tot.withinss)
besti = which.min(i)
best = results[[besti]]
bfn = sub("Result", "Best", fns[[besti]])
save(best, file=bfn)
