treat<-read.table("7plates.txt",head=T,row.names=1,sep="\t")
fc<-matrix(rep(0), nrow = 1273,ncol=2564)
for (i in 1:2563){
    cutoffi<-as.numeric(treat[,i])
    cutoffm<-as.numeric(treat[,i+1])
    indexi<-which(cutoffi!=0 & cutoffm!=0)
    Timei <- rep(10, length(cutoffi))
    fc[indexi,i]<-as.numeric(Timei[indexi])
}

a<-matrix(rep(1:2564,2), nrow = 2)
for (i in 1:2564){
    a[,i]<-table(fc[,i])
}
colnames(a) <- colnames(treat)
write.table(a,"7plates_overlap.txt")
