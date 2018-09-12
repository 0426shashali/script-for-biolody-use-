#combine,rename rows
cir<-read.table("cirRNA_CLR_overlapped_in_5_samples.txt",row.names=1)
v1<-as.matrix(read.table("1.txt"))
v2<-as.matrix(read.table("2.txt"))
v3<-as.matrix(read.table("3.txt"))
v4<-as.matrix(read.table("4.txt"))
v5<-as.matrix(read.table("5.txt"))
v6<-as.matrix(read.table("6.txt"))
v7<-as.matrix(read.table("7.txt"))
v8<-as.matrix(read.table("8.txt"))
v9<-as.matrix(read.table("9.txt"))
v10<-as.matrix(read.table("10.txt"))
v11<-as.matrix(read.table("11.txt"))
v12<-as.matrix(read.table("12.txt"))
v13<-as.matrix(read.table("13.txt"))
v14<-as.matrix(read.table("14.txt"))
v15<-as.matrix(read.table("15.txt"))
v16<-as.matrix(read.table("16.txt"))
v17<-as.matrix(read.table("17.txt"))
v18<-as.matrix(read.table("18.txt"))
total<-rbind(v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13,v14,v15,v16,v17,v18)
dim(total)
dim(cir)

rownames(total) <- rownames(cir)
dim(total)
number<-rep(0,3420)
maxi<-rep(0,3420)
mini<-rep(0,3420)
for (i in 1:3420) {
   m<-table(total[i,])
   mz<-m['0']
   number[i]<-mz
   maxi[i]<-max(total[i,])
   mini[i]<-min(total[i,])
}
total_cir3<-cbind(total,number,maxi,mini)
new_cir3<-subset(total_cir3,number<31859 | maxi >=0.9 | mini <=-0.9)
dim(new_cir3)
write.table(new_cir3,"cirRNA_CLR_overlapped_in_5_samples_combine_pcc.txt",sep="\t")

#get correlated number,get final pcc

cir1<-new_cir3[,1:31860]
mrna<-read.table("/Share/home/wangdong/lss/project/cir/new_DEGs/DEGs_pick/mRNA_ratio.txt",head=T,row.names=1,sep="\t")
t<-t(cir1)
dim(mrna)
dim(t)
rownames(t) <- rownames(mrna)
total_t<-t
number<-rep(0,31860)
for (i in 1:31860) {
   m<-table(total_t[i,])
   mz<-m['0']
   number[i]<-mz
}
write.table(number,"CLR_number.txt")

total_cir3<-cbind(total_t,number)
new_cir3<-subset(total_cir3,number<3410)
dim(new_cir3)
write.table(new_cir3,"pcc_CLR_100.txt",sep="\t")


#单独命名
> cir<-read.table("cirRNA_CLR_overlapped_in_5_samples.txt",row.names
=1)
> mrna<-read.table("/Share/home/wangdong/lss/project/cir/new_DEGs/DE
Gs_pick/mRNA_ratio.txt",head=T,row.names=1,sep="\t")
> dim(mrna)
[1] 31860    10
> rownames(t) <- rownames(mrna)
> dim(t)
[1] 31860  3420
> colnames(t) <- colnames(cir)