
Idents(mm) <- "celltypes"


mm_markers<-FindAllMarkers(mm, only.pos = TRUE, min.pct = 0.25, logfc.threshold = 0.25,test.use = "roc")

# get the normalized counts for sevearl marker genes obtained in mm_markers
gene1<- FetchData(mm_integrated_subset, vars = c("GNAT2","NEFM","SLC6A1","RHO","B2M","SLC1A3","ONECUT1","TRPM1"))

write.table(gene1,"fetchdata_markergenes.txt",sep = "\t")

# split gene counts matrix by cell type, and add the cell type identity annotated for each cell

cone <-read.table("cone.txt",head=T,row.names = 1,sep="\t")
RGCs <-read.table("RGCs.txt",head=T,row.names = 1,sep="\t")
ACs <-read.table("ACs.txt",head=T,row.names = 1,sep="\t")
Rod <-read.table("Rod.txt",head=T,row.names = 1,sep="\t")
Microglia <-read.table("Microglia.txt",head=T,row.names = 1,sep="\t")
MG <-read.table("MG.txt",head=T,row.names = 1,sep="\t")
HCs <-read.table("HCs.txt",head=T,row.names = 1,sep="\t")
BPs <-read.table("BPs.txt",head=T,row.names = 1,sep="\t")


# roc for each genes in each cell type

roc1<- roc(response= cone$combineT,predictor = cone$GNAT2)
roc2<- roc(response= RGCs$combineT,predictor = RGCs$NEFM)
roc3<- roc(response= ACs$combineT,predictor = ACs$SLC6A1)
roc4<- roc(response= Rod$combineT,predictor = Rod$RHO)
roc5<- roc(response= Microglia$combineT,predictor = Microglia$B2M)
roc6<- roc(response= MG$combineT,predictor = MG$SLC1A3)
roc7<- roc(response= HCs$combineT,predictor = HCs$ONECUT1)
roc8<- roc(response= BPs$combineT,predictor = BPs$TRPM1)

par(pty="s")
plot(roc1, grid = TRUE, col="#F0BACD", legacy.axes = TRUE)

plot.roc(roc2, add=T, col="#FF515F", grid = TRUE, legacy.axes = TRUE)

plot.roc(roc3, add=T, col="#00B050", grid = TRUE, legacy.axes = TRUE)

plot.roc(roc4, add=T, col="#0096FF", grid = TRUE, legacy.axes = TRUE)


plot.roc(roc5, add=T, col="#EA9847", grid = TRUE, legacy.axes = TRUE)

plot.roc(roc6, add=T, col="#FFFC00", grid = TRUE, legacy.axes = TRUE)
plot.roc(roc7, add=T, col="blue", grid = TRUE, legacy.axes = TRUE)
plot.roc(roc8, add=T, col="#BB7DC4", grid = TRUE, legacy.axes = TRUE)




