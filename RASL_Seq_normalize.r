#normalization
stable<-read.table("stable.txt",head=T,row.names=1)
total<-read.table("filtered_samples.txt",head=T,row.names=1)
me<-apply(stable,2,median)
head(me)
for (i in 1:337){
    total[,i]=round(100*total[,i]/me[i],digits=2)
}
write.table(total,"normalized_by_median100.txt")