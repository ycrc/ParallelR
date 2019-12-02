
args = commandArgs(trailingOnly=TRUE)

task=as.integer(args[[1]])
cluster=as.integer(args[[2]])
nstart=as.integer(args[[3]])

rides<-read.csv('../Data/uber-raw-data-jun14.csv')
locs<-rides[,c('Lat','Lon')]

res<-kmeans(locs, cluster, nstart=nstart)
filename<-paste("Result",task,cluster,nstart,".RData", sep="_")
save(res, file=filename)
