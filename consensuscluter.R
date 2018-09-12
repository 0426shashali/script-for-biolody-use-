library(ConsensusClusterPlus)
library(pheatmap)

##### ConsensusCluster
## mRNA
dat=read.table('OV.mRNAseq_RPKM_log2.txt',header=T,row.names=1)
dat[1:5,1:5]
dat1=log(dat+0.01)
mads=apply(dat1,1,mad)
top2000<-dat1[order(mads,decreasing='T')[1:2000],]
dat_new<-dat1[rev(order(mads))[1:2000],]
d<-sweep(top2000,1,apply(dat_new,1,median,na.rm=T))
results<-ConsensusClusterPlus(as.matrix(d),maxK=7,reps=50,pItem=0.8,pFeature=0.8,title='OV1',clusterAlg="hc",distance="pearson",plot="pdf")

ann_col=data.frame(sub=results[[3]]$consensusClass [(order(results[[3]]$consensusClass))])
rownames(ann_col)=names(results[[3]]$consensusClass [(order(results[[3]]$consensusClass))])
ann_col$sub=paste('C',ann_col$sub,sep='')
ann_col$sub=as.factor(ann_col$sub)

for(i in (1:265))
{
	d[d[,i]>3,i] <- 3
	d[d[,i]<(-3),i] <- (-3)
}


pheatmap(d[,order(results[[3]]$consensusClass)],col=colorRampPalette(c('blue','white','red'))(50),cluster_col=F,cluster_row=F,show_rownames=F,annotation_col=ann_col)
dev.off()

km=kmeans(d,7)
d$cl=km$cluster
d=d[order(d$cl),]
pheatmap(d[d$cl%in%c(1,5,6,7),order(results[[3]]$consensusClass)],col=colorRampPalette(c('blue','white','red'))(50),cluster_col=F,cluster_row=F,show_rownames=F,annotation_col=ann_col)
dev.off()
