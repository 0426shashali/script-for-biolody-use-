a <- read.table( "Lane1_plate1.txt",head=T,row.names=1)
dmso<-cbind(a$lane1_plate1_L3,a$lane1_plate1_M3,a$lane1_plate1_N3,a$lane1_plate1_O3,a$lane1_plate1_I9,a$lane1_plate1_J9,a$lane1_plate1_K9,a$lane1_plate1_L9,a$lane1_plate1_E16,a$lane1_plate1_F16,a$lane1_plate1_G16,a$lane1_plate1_H16,a$lane1_plate1_B22,a$lane1_plate1_C22,a$lane1_plate1_D22,a$lane1_plate1_E22)
colnames(dmso)<-c("lane1_plate1_L3","lane1_plate1_M3","lane1_plate1_N3","lane1_plate1_O3","lane1_plate1_I9","lane1_plate1_J9","lane1_plate1_K9","lane1_plate1_L9","lane1_plate1_E16","lane1_plate1_F16","lane1_plate1_G16","lane1_plate1_H16","lane1_plate1_B22","lane1_plate1_C22","lane1_plate1_D22","lane1_plate1_E22")
for (i in 1:384){
	sample<-cbind(a[,i],dmso)
	colnames(sample)<-c(colnames(a[i]),colnames(dmso))
	rownames(sample)<-rownames(a)
	filename=paste(colnames(a[i]),"txt",sep=".")
	write.table(sample, filename,sep="\t")
}