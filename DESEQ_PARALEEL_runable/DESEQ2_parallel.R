library(DESeq2)
library(BiocParallel)
library("PoiClaClu")
library("RColorBrewer")
args<-commandArgs(T)

countData <- read.table( args[ 1 ],head=T,row.names=1)
colData <- data.frame(row.names=colnames(countData),
                     condition=c("case",rep("con",15)))
dds <- DESeqDataSetFromMatrix(countData = countData,
                              colData = colData,
                              design = ~ condition)
dds <- DESeq(dds)
res <- results(dds,contrast=c("condition","case","con"))
pdf(args[2])
plotMA(res)
dev.off()
register(MulticoreParam(4))
write.table(res,file=args[3],sep="\t")

DESeq2.res=subset(res,res$pvalue<0.05)
DESeq2.res=as.data.frame(DESeq2.res)
write.table(DESeq2.res,file=args[4],sep="\t")

filtered =subset(DESeq2.res,abs(DESeq2.res$log2FoldChange)>=1)

write.table(filtered,file=args[5],sep="\t")