library(DESeq2)
library(BiocParallel)
library("PoiClaClu")
library("RColorBrewer")

library("pheatmap")

countData <- read.table("SETD6_rm_bad_nc.txt",head=T,row.names=1)
colData <- data.frame(row.names=colnames(countData),
                     condition=c(rep("case",2),rep("con",17)))
dds <- DESeqDataSetFromMatrix(countData = countData,
                              colData = colData,
                              design = ~ condition)
#poison heatmap,Another option for calculating sample distances is to use the Poisson Distance ,his measure of dissimilarity between counts also takes the inherent variance structure of counts into consideration when calculating the distances between samples.
poisd <- PoissonDistance(t(counts(dds)))
samplePoisDistMatrix <- as.matrix( poisd$dd )

rownames(samplePoisDistMatrix) <- colnames(countData)
colnames(samplePoisDistMatrix) <- NULL
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)

pdf("heatmap_poison_SETD6_rm_bad_nc.pdf")
pheatmap(samplePoisDistMatrix,
         clustering_distance_rows=poisd$dd,
         clustering_distance_cols=poisd$dd,
         col=colors)
dev.off()
#distance heatmap
rld <- rlog(dds, blind=FALSE)
sampleDists <- dist( t( assay(rld) ) )
sampleDists
sampleDistMatrix <- as.matrix( sampleDists )
rownames(sampleDistMatrix) <- colnames(countData)
colnames(sampleDistMatrix) <- NULL
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
pdf("heatmap_hist_SETD6_rm_bad_nc.pdf")
pheatmap(sampleDistMatrix,
         clustering_distance_rows=sampleDists,
         clustering_distance_cols=sampleDists,
         col=colors)
dev.off()
pdf("pca_SETD6_rm_bad_nc.pdf")
plotPCA(rld)
dev.off()

dds <- DESeq(dds)
res <- results(dds)
#estimating size factors
#estimating dispersions
#gene-wise dispersion estimates
#mean-dispersion relationship
#final dispersion estimates
#fitting model and testing
pdf("SETD6_rm_bad_nc_MAplot.pdf")
plotMA(res)
dev.off()
pdf("SETD6_rm_bad_nc_deseq.pdf")
hist(res$pval, breaks=100, col="skyblue", border="slateblue", main="")
register(MulticoreParam(4))
write.table(res,file="SETD6_rm_bad_nc_deg.txt",sep="\t")
dev.off()