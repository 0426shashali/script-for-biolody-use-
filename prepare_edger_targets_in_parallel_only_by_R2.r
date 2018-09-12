a<-read.table("file_name.txt",sep="\t")
dmso<-read.table("DMSO.txt",sep="\t")
for (i in 1:384){
	file<-a[i,]
    file1<-rbind(file,dmso)
    colnames(file1)=c("file","group","description")
    filename=paste(as.character(a[i,3]),"_targets",".txt",sep="")
    write.table(file1,filename,sep="\t",quote=F,col.names=NA)
}