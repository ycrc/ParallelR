

spin<-function(sec) {

  start<-proc.time()[[3]]

  while (TRUE) {
    z=1;
    for (i in 1:100000) {
      z<-z+1
    }
    now<-proc.time()[[3]]
    if (now-start > sec) { break } 
  }
}
