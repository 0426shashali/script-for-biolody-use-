#利用每个板的5dmso的平均值作为一列进行过滤
fc<-read.table("lane7_plate1_fc.txt",head=T,row.names=1,sep="\t")
dmso<-read.table("lane7_plate1_dmso_average.txt",head=T,row.names=1,sep="\t")
treat<-read.table("lane7_plate1_treat.txt",head=T,row.names=1,sep="\t")
stable<-read.table("lane7_plate1_stable.txt",head=T,row.names=1,sep="\t")
me<-apply(stable,2,median)
dmso_cutoff<-as.numeric(dmso[,1])
index1<-which(dmso_cutoff<=5.677707)
Time <- rep(0, length(dmso_cutoff))
fc[index1,]<-as.numeric(Time[index1])

#利用treat自己对fc进行过滤，变成0
for (i in 1:375){
    cutoff<-as.numeric(treat[,i])
    indexi<-which(cutoff<=100*5/me[i])
    Timei <- rep(0, length(cutoff))
    fc[indexi,i]<-as.numeric(Timei[indexi])
}
write.table(fc,"lane7_plate1_fc_filtered_by_median5.txt")

#将-1<fc<1为0，可以将全部的板子合在一起一起过滤
for (i in 1:375){
    cutoff<-as.numeric(fc[,i])
    indexi<-which(cutoff <1 & cutoff >-1)
    Timei <- rep(0, length(cutoff))
    fc[indexi,i]<-as.numeric(Timei[indexi])
}
write.table(fc,"lane7_plate1_fc_by_minor1to1.txt")

#将fc变成>1 <-1为一类
for (i in 1:375){
    cutoff<-as.numeric(fc[,i])
    indexi<-which(cutoff!=0)
    Timei <- rep(10, length(cutoff))
    fc[indexi,i]<-as.numeric(Timei[indexi])
}
write.table(fc,"lane7_plate1_fc_modified_final_v2.txt")

a<-matrix(rep(1:375,2), nrow = 2)
for (i in 1:375){
    a[,i]<-table(fc[,i])
}

colnames(a) <- colnames(fc)
write.table(a,"lane7_plate1_clasification.txt")