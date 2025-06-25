
stim12_f<-readRDS("stim12_f.rds")
stim13_f<-readRDS("stim13_f.rds")

stim12 <- CreateSeuratObject(counts = stim12_f@assays$RNA@counts, project = "stim12", min.cells = 3, min.features = 200)
stim12 <- NormalizeData(stim12, normalization.method = "LogNormalize", scale.factor = 10000)

stim12 <- FindVariableFeatures(stim12)



stim13 <- CreateSeuratObject(counts = stim13_f@assays$RNA@counts, project = "stim13_f", min.cells = 3, min.features = 200)

stim13 <- NormalizeData(stim13, normalization.method = "LogNormalize", scale.factor = 10000)

stim13 <- FindVariableFeatures(stim13, selection.method = "vst", nfeatures = 2000)




immune.anchorsr <- FindIntegrationAnchors(object.list = list(stim12, stim13), dims = 1:20)
immune.combinedr <- IntegrateData(anchorset = immune.anchorsr, dims = 1:20)
DefaultAssay(immune.combinedr) <- "integrated"
immune.combinedr <- ScaleData(immune.combinedr, verbose = FALSE)
immune.combinedr <- RunPCA(immune.combinedr, npcs = 30, verbose = FALSE)
ElbowPlot(immune.combinedr)


immune.combinedr <- RunUMAP(immune.combinedr, reduction = "pca", dims = 1:20)
DimPlot(immune.combinedr, reduction = "umap", label = TRUE)





# t-SNE and Clustering
immune.combinedr <- FindNeighbors(immune.combinedr, reduction = "pca", dims = 1:20)
immune.combinedr <- FindClusters(immune.combinedr, resolution = 0.5)
immune.combinedr <- RunUMAP(immune.combinedr, reduction = "pca", dims = 1: 20)

DimPlot(immune.combinedr, reduction = "umap", label = TRUE)

#Cone
FeaturePlot(immune.combinedr, features = c("OPN1LW", "RAB41", "CRX", "GRK7", "MEGF9", "CPE", "CNGB3", "UNC119", "GNGT2", "ARR3", "SMAD2"),min.cutoff = "q10", max.cutoff = "q90")
VlnPlot(immune.combinedr, features =c("RAB41", "GRK7", "CPE", "CNGB3", "UNC119", "GNGT2", "ARR3", "SMAD2","RS1"), pt.size = 0, combine = T)

#Rods
FeaturePlot(immune.combinedr, features = c("RHO", "PDE6B", "GNAT1", "PDE6A", "NR2E3", "AIPL1", "CNGB1", "UNC119", "MFGE8", "EPB41L2", "HMGN1", "CNGA1"),min.cutoff = "q10", max.cutoff = "q90")
VlnPlot(immune.combinedr, features =c("RHO", "PDE6B", "PDE6G", "GNAT1", "PDE6A", "NR2E3", "AIPL1", "CNGB1", "UNC119", "MFGE8", "EPB41L2", "HMGN1", "CNGA1",), pt.size = 0, combine = T)


#BPs

FeaturePlot(immune.combinedr, features = c("VSX1", "VSX2","TRPM1", "CAMK2B", "RGS16", "GRM6", "SLC38A1", "TRNP1", "LRTM1", "EFR3A", "GRIK1", "NTNG1", "NETO1"),min.cutoff = "q10", max.cutoff = "q90")

VlnPlot(immune.combinedr, features =c("VSX1", "VSX2","TRPM1", "CAMK2B", "RGS16", "GRM6", "SLC38A1", "TRNP1", "LRTM1", "EFR3A", "GRIK1", "NTNG1", "NETO1"), pt.size = 0, combine = T)



#ACs
FeaturePlot(immune.combinedr, features = c("GAD1", "GAD2", "SLC32A1", "PAX6", "SLC6A9", "SLC6A1", "SYNPR"),min.cutoff = "q10", max.cutoff = "q90")
VlnPlot(immune.combinedr, features = c("GAD1", "GAD2", "SLC32A1", "PAX6", "SLC6A9", "SLC6A1", "SYNPR"), pt.size = 0, combine = T)



#HC
FeaturePlot(immune.combinedr, features = c("TNR", "ONECUT1", "ONECUT2", "FRMPD4", "SLC4A3", "LHX1", "ONECUT3", "NDFIP1"),min.cutoff = "q10", max.cutoff = "q90")
VlnPlot(immune.combinedr, features = c("TNR", "ONECUT1", "ONECUT2", "FRMPD4", "SLC4A3", "LHX1", "ONECUT3", "NDFIP1"), pt.size = 0, combine = T)
#nature 16 species hc
FeaturePlot(immune.combinedr, features = c("ONECUT1", "ONECUT2", "LHX1", "SLC4A3", "CALB1", "VIM", "WDR72"),min.cutoff = "q10", max.cutoff = "q90")
VlnPlot(immune.combinedr, features = c("ONECUT1", "ONECUT2", "LHX1", "SLC4A3", "CALB1", "VIM", "WDR72"), pt.size = 0, combine = T)




#rgc
FeaturePlot(immune.combinedr, features = c("NEFL", "THY1", "POU4F1","RBPMS","SNCG","NEFM","SLC17A6","RBPMS2"),min.cutoff = "q10", max.cutoff = "q90")
VlnPlot(immune.combinedr, features = c("NEFL", "THY1", "POU4F1","RBPMS","SNCG","NEFM","SLC17A6","RBPMS2"), pt.size = 0, combine = T)


#MG
FeaturePlot(immune.combinedr, features = c("SLC1A3", "RLBP1", "APOE","GLUL","SFRP2"),min.cutoff = "q10", max.cutoff = "q90")

VlnPlot(immune.combinedr, features = c("SLC1A3", "RLBP1", "APOE","GLUL","SFRP2"), pt.size = 0, combine = T)

#microglia
FeaturePlot(immune.combinedr, features = c("B2M", "CD74", "C1QA", "C1QC", "C1QB", "LYN","CLU","CSF1R","SPI1"),min.cutoff = "q10", max.cutoff = "q90")

VlnPlot(immune.combinedr, features = c("B2M", "CD74", "C1QA", "C1QC", "C1QB", "LYN","CLU","CSF1R","SPI1"), pt.size = 0, combine = T)




table(immune.combinedr$seurat_cluster)
#based on featureplot of makers, annotated the cell type
replicate.infom<-read.table("mouse_celltype.txt",head=TRUE,row.names=1,sep="\t")
mouse <- AddMetaData(object = immune.combinedr, metadata = replicate.infom)
DimPlot(mouse,group.by = "celltype")


                    
my_levels <- c("Amacrine cells", "Rods", "Bipolar cells", "Cones", "Horizontal cells", "RGCs", "Microglia", "MG")


levels(mouse) <- my_levels

DimPlot(mouse, reduction = "umap", cols=c("#00B050","#0096FF","#BB7DC4","#F0BACD","blue","#FF515F","#EA9847","#FFFC00"),pt.size = 0.1)

 
markers.to.plot <- c("SPI1", "CSF1R", "LYN", "C1QB", "C1QC", "C1QA", "CD74", "B2M", "SFRP2", "GLUL", "APOE", "RLBP1", "SLC1A3", "RBPMS2", "SLC17A6", "NEFM", "SNCG", "RBPMS", "POU4F1", "THY1", "NEFL", "NDFIP1", "ONECUT3", "LHX1", "SLC4A3", "FRMPD4", "ONECUT2", "ONECUT1", "TNR", "SYNPR", "SLC6A1", "SLC6A9", "PAX6", "SLC32A1", "GAD2", "GAD1", "NETO1", "NTNG1", "GRIK1", "EFR3A", "LRTM1", "TRNP1", "SLC38A1", "GRM6", "RGS16", "CAMK2B", "TRPM1", "VSX2", "VSX1", "CNGA1", "HMGN1", "EPB41L2", "MFGE8", "UNC119", "CNGB1", "AIPL1", "NR2E3", "PDE6A", "GNAT1", "PDE6B", "RHO", "SMAD2", "ARR3", "GNGT2", "CNGB3", "CPE", "MEGF9", "GRK7", "CRX", "RAB41", "OPN1LW")

           
my_levels <- c("Microglia","MG", "RGCs", "Horizontal cells", "Amacrine cells", "Bipolar cells", "Rods","Cones")

levels(mouse) <- my_levels

DotPlot(mouse, features = rev(markers.to.plot), cols = c("black", "orange"), dot.scale = 7) + RotatedAxis() 


 
 
 
 
