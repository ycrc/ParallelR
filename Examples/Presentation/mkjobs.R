
# this script generates the job file for our dSQ run

id=1
sink("jobs.txt")
for (i in 1:10) {
  for (c in 2:5) {
    cat(paste("module load R; Rscript ex4.R", id, c, 100, "\n", sep=" "))
    id<-id+1
  }
}
