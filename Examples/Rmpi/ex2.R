library("Rmpi")
library(logging)

SIZE=10
COMM=0

basicConfig()
loginfo("hello world")

ring<-function(me, proc) {
  field = 1:SIZE
  mpi.barrier(COMM)

  if (me == 0) {
      print("0 sending")
      mpi.send(field, 1, 1, 1, COMM)
      print("0 sent")
  }
  if (me == 1) {
      print("1 receiving")
      mpi.recv(field, 1, 0, 1, COMM)
      print("1 received")
  }
  print(paste("Done 1", me))
    if (me==0) {
      mpi.send(field, 1, 1, 1, COMM)
      got<-mpi.recv(field, 1, proc-1, 1, COMM)
    }
    else {
      got<-mpi.recv(field, 1, me-1, 1, COMM)
      mpi.send(field, 1, (me+1)%%proc, 1, COMM)
    }
  mpi.bcast(field, 1, 0, COMM)
  print(paste("Done 2", me))
}

proc<-mpi.comm.size(COMM)
me<-mpi.comm.rank(COMM)

ring(me, proc)

mpi.quit()

