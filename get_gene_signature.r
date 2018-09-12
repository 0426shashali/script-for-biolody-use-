fc<-read.table("lane8_plate4_fc.txt",head=T,row.names=1,sep="\t")
dmso<-read.table("lane8_plate4_dmso_average.txt",head=T,row.names=1,sep="\t")
treat<-read.table("lane8_plate4_treat.txt",head=T,row.names=1,sep="\t")
stable<-read.table("lane8_plate4_stable.txt",head=T,row.names=1,sep="\t")
me<-apply(stable,2,median)
dmso_cutoff<-as.numeric(dmso[,1])
index1<-which(dmso_cutoff<=8.41600529)
Time <- rep(0, length(dmso_cutoff))
fc[index1,]<-as.numeric(Time[index1])

for (i in 1:356){
    cutoff<-as.numeric(treat[,i])
    indexi<-which(cutoff<=100*5/me[i])
    Timei <- rep(0, length(cutoff))
    fc[indexi,i]<-as.numeric(Timei[indexi])
}
write.table(fc,"lane8_plate4_fc_filtered_by_median5.txt")

for (i in 1:356){
    cutoff<-as.numeric(fc[,i])
    indexi<-which(cutoff <1 & cutoff >-1)
    Timei <- rep(0, length(cutoff))
    fc[indexi,i]<-as.numeric(Timei[indexi])
}
write.table(fc,"lane8_plate4_fc_by_minor1to1.txt")

for (i in 1:356){
    cutoff<-as.numeric(fc[,i])
    indexi<-which(cutoff!=0)
    Timei <- rep(10, length(cutoff))
    fc[indexi,i]<-as.numeric(Timei[indexi])
}
write.table(fc,"lane8_plate4_fc_modified_final_v2.txt")

a<-matrix(rep(1:356,2), nrow = 2)
for (i in 1:356){
    a[,i]<-table(fc[,i])
}

colnames(a) <- colnames(fc)
write.table(a,"lane8_plate4_clasification.txt")