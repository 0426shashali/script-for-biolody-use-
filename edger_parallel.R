library("limma")
library("methods")
library("edgeR")
args<-commandArgs(T)
targets = readTargets(args[ 1 ])

d = readDGE(targets$file,group = targets$group)
colnames(d) = targets$description
d$samples$lib.size = colSums(d$counts)

d = calcNormFactors(d)
d = estimateCommonDisp(d)
d = estimateTagwiseDisp(d)
pdf(args[2])
plotBCV(d)
dev.off()
de = exactTest(d, pair = c("CONTROL","TREAT"))
### differential expreesed gene
top = topTags(de)

deinfo = de$table
value<-as.matrix(d[rownames(de),])
fold<-deinfo[rownames(de),]
result<-cbind(value,fold)
write.table(result,args[3],quote = F, col.names = NA, row.names = T, sep = "\t")

edger.res=subset(deinfo,deinfo$PValue<0.05)
edger.res=as.data.frame(edger.res)
write.table(edger.res,file=args[4],quote = F, col.names = NA, row.names = T, sep = "\t")
filtered =subset(edger.res,abs(edger.res$logFC)>=1)
write.table(filtered,file=args[5],quote = F, col.names = NA, row.names = T, sep = "\t")

summary(de.sig <- decideTestsDGE(de))

detags <- rownames(d)[as.logical(de.sig,n=500)]
result.sig = result[detags,]
pdf(args[6])
plotSmear(de,de.tags = detags)
abline(h =c(-1,1), col = "blue")
dev.off()

