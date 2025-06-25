setwd("./revise/")

library(Seurat)
library(SeuratObject)

stim7<-readRDS("stim7.rds")
stim8<-readRDS("stim8.rds")
stim14<-readRDS("stim14.rds")
stim16<-readRDS("stim16.rds")
stim23<-readRDS("stim23.rds")
stim24<-readRDS("stim24.rds")
stim26<-readRDS("stim26.rds")


features <- SelectIntegrationFeatures(object.list = list(stim8, stim23, stim14, stim24, stim26, stim7, stim16))

bm280k.list <- list(stim8, stim23, stim14, stim24, stim26, stim7, stim16)

bm280k.list <- lapply(X = bm280k.list, FUN = function(x) {
    x <- ScaleData(x, features = features, verbose = FALSE)
    x <- RunPCA(x, features = features, verbose = FALSE)
})



anchors <- FindIntegrationAnchors(object.list = bm280k.list, reference = c(6), reduction = "rpca",
    dims = 1:50)
    
bm280k.integrated <- IntegrateData(anchorset = anchors, dims = 1: 50)
bm280k.integrated <- ScaleData(bm280k.integrated, verbose = FALSE)
bm280k.integrated <- RunPCA(bm280k.integrated, verbose = FALSE)
bm280k.integrated <- RunUMAP(bm280k.integrated, dims = 1: 50)
bm280k.integrated <- FindNeighbors(bm280k.integrated, reduction = "pca", dims = 1: 50)
bm280k.integrated <- FindClusters(bm280k.integrated, resolution = 0.5)
DimPlot(bm280k.integrated, reduction = "umap", label = TRUE)


replicate.infom<-read.table("mamal_celltype_merged.txt",head=TRUE,row.names=1,sep="\t")
bm280k.integrated <- AddMetaData(object = bm280k.integrated, metadata = replicate.infom)

DimPlot(bm280k.integrated,group.by = "celltypes_merged")

FeaturePlot(bm280k.integrated, features = c("ARR3", "PDE6C", "RHO", "PDE6A", "PDE6B", "VSX1", "VSX2", "GAD1", "GAD2", "THY1", "TNR", "SLC1A3", "C1QC"), min.cutoff = "q9", max.cutoff = "q90",order=TRUE)



saveRDS(bm280k.integrated,"mamal_integrated_annotated.rds")


table(bm280k.integrated$celltypes)
      
     
Idents(bm280k.integrated) <- "celltypes"


                   
my_levels <- c("ACs", "Rod", "BPs", "Cones", "HCs", "RGCs", "Microglia", "MG")


levels(bm280k.integrated) <- my_levels

DimPlot(bm280k.integrated, reduction = "umap", cols=c("#00B050","#0096FF","#BB7DC4","#F0BACD","blue","#FF515F","#EA9847","#FFFC00"),pt.size = 0.1)

      
Idents(bm280k.integrated) <- "orig.ident"

stim7<-readRDS("stim7.rds")
stim8<-readRDS("stim8.rds")
stim14<-readRDS("stim14.rds")
stim16<-readRDS("stim16.rds")
stim23<-readRDS("stim23.rds")
stim24<-readRDS("stim24.rds")
stim26<-readRDS("stim26.rds")
      
my_levels <- c("Monkey ", "Pig ", "Ferret ", "Hedgehog ", "Cat ", "Dog ", "Human ")

levels(bm280k.integrated) <- my_levels

DimPlot(bm280k.integrated, group.by = "orig.ident", cols=c("#4FAFF7","#4BA5F8","#4FAFF7","#A2A633","#5CB334","#AC88F8","#EC62AE","#EC6A8F"),pt.size = 0.1)

