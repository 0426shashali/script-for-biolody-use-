
fc<-read.table("total_fc.txt",head=T,row.names=1)
for (i in 1:2564){
    cutoff<-as.numeric(fc[,i])
    indexi<-which(cutoff>=1)
    Timei <- rep(1, length(cutoff))
    fc[indexi,i]<-as.numeric(Timei[indexi])
}
write.table(fc,"total_above1.txt")

for (i in 1:2564){
    cutoff<-as.numeric(fc[,i])
    indexi<-which(cutoff<=-1)
    Timei <- rep(-1, length(cutoff))
    fc[indexi,i]<-as.numeric(Timei[indexi])
}
write.table(fc,"total_above1_below1.txt")
