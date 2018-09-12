args<-commandArgs(T)
dmso<-read.table("DMSO.txt",sep="\t")
file<-rbind(args[ 1 ],dmso)
write.table(file,file=args[2],sep="\t")
