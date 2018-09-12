a <- read.table( "Lane1_plate1.txt",head=T,row.names=1)
for (i in 1:384){
	sample<-as.matrix(a[,i])
	colnames(sample)<-colnames(a[i])
	rownames(sample)<-rownames(a)
	filename=paste(colnames(a[i]),"txt",sep=".")
	write.table(sample, filename,sep="\t", quote = F,col.names=NA)
}