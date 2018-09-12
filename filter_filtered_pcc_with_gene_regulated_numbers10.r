v16<-as.matrix(read.table("/Share/home/wangdong/lss/project/cir/split_dir/cir16/new_cir16.txt"))
v17<-as.matrix(read.table("/Share/home/wangdong/lss/project/cir/split_dir/cir17/new_cir17.txt"))
v18<-as.matrix(read.table("/Share/home/wangdong/lss/project/cir/split_dir/cir18/new_cir18.txt"))
total1<-rbind(v16,v17,v18)
cir1<-total1[,1:31860]
mrna<-read.table("/Share/home/wangdong/lss/project/cir/split_dir/cir1/selected_mRNA.txt",head=T,row.names=1,sep="\t")
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
write.table(number,"cir1_gene_zero_7to9.txt")
total_cir3<-cbind(total_t,number)
new_cir3<-subset(total_cir3,number<17143)
dim(new_cir3)
write.table(new_cir3,"filtered_with_gene_16to18.txt",sep="\t")
