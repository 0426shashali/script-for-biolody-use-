library(pheatmap)

data<-read.table("hepg2_classification_12h.txt",head=T,row.names=1,sep='\t')
data<-data.matrix(data)
ann_col<-read.table("ano_row_hepg2_12h.txt",head=T,row.names=1,sep='\t')
ann_row<-read.table("ano_col_hepg2.txt",head=T,row.names=1,sep='\t')


annotation_col = data.frame(
Time=factor(ann_col$time),Med_property=factor(ann_col$property)
)

rownames(annotation_col)=rownames(ann_col)

annotation_row = data.frame(
Gene_pathway=factor(ann_row$pathway)
)

rownames(annotation_row) =rownames(ann_row)

pdf(file="hepg2_classification_12h.pdf",height=8,width=8)
pheatmap(data,cluster_row=TRUE,cluster_col=FALSE,show_rownames=F,show_colnames=F,color = colorRampPalette(c("navy", "white", "firebrick3"))(50),cellwidth=0.8,cellheight=0.4,fontsize_col=8,annotation_col = annotation_col,annotation_row = annotation_row)
dev.off()
q()
