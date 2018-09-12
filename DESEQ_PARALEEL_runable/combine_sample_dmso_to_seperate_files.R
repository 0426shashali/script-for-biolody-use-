a <- read.table( "plate_new.txt",head=T,row.names=1,sep="\t")
dmso<-cbind(a$lane8_ll_dplusj_17,a$lane8_ll_dplusj_18,a$lane8_ll_dplusj_19,a$lane8_ll_dplusj_20,a$lane8_ll_dplusj_21,a$lane8_ll_dplusj_22,a$lane8_ll_dplusj_23,a$lane8_ll_dplusj_24,a$lane8_ll_dplusj_25,a$lane8_ll_dplusj_26,a$lane8_ll_dplusj_27,a$lane8_ll_dplusj_28,a$lane8_ll_dplusj_30,a$lane8_ll_dplusj_31,a$lane8_ll_dplusj_32)
colnames(dmso)<-c("lane8_ll_dplusj_17","lane8_ll_dplusj_18","lane8_ll_dplusj_19","lane8_ll_dplusj_20","lane8_ll_dplusj_21","lane8_ll_dplusj_22","lane8_ll_dplusj_23","lane8_ll_dplusj_24","lane8_ll_dplusj_25","lane8_ll_dplusj_26","lane8_ll_dplusj_27","lane8_ll_dplusj_28","lane8_ll_dplusj_30","lane8_ll_dplusj_31","lane8_ll_dplusj_32")
for (i in 1:30){
	sample<-cbind(a[,i],dmso)
	colnames(sample)<-c(colnames(a[i]),colnames(dmso))
	rownames(sample)<-rownames(a)
	filename=paste(colnames(a[i]),"txt",sep=".")
	write.table(sample, filename,sep="\t")
}