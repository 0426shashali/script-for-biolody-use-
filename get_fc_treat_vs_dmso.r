treat<-read.table("lane7_plate1_treat.txt",head=T,row.names=1)
control<-read.table("lane7_plate1_dmso.txt",head=T,row.names=1)
treat<-(log2(treat/as.matrix(control[,1]))+log2(treat/as.matrix(control[,2]))+log2(treat/as.matrix(control[,3]))+log2(treat/as.matrix(control[,4]))+log2(treat/as.matrix(control[,5])))/5
write.table(treat,"lane7_plate1_fc.txt")