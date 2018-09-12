m<-list.files("/Share/home/wangdong/lss/project/cir/split_dir/cir2",pattern ="correlation_x")
for (i in 1:length(m)){
    a<-read.table(m[i],head=T,row.names=1)
    a<-replace(a,abs(a)<0.8,0)
    keep = rowSums(a)!=0
    write.table(a,paste("/Share/home/wangdong/lss/project/cir/split_dir/cir2/",i,".txt",sep=''))
}