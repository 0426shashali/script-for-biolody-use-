library(Seurat)
library(SeuratObject)
Budgerigar<-readRDS("Budgerigar_subset_final.rds")
canary<-readRDS("canary_subset_final.rds")
cat<-readRDS("cat_subset_subset_final.rds")
chicken<-readRDS("chicken_subset_subset_final_use.rds")
duck<-readRDS("duck_subset_final.rds")
human<-readRDS("human_correct_celltypes_final.rds")
mouse<-readRDS("mouse_subset_final.rds")
snake<-readRDS("snake_celltype_annotated_bymarkers.rds")
snakehead<-readRDS("snakehead_subset_final.rds")
tilia<-readRDS("tilia_subset_final.rds")


Budgerigar <- CreateSeuratObject(counts = Budgerigar@assays$RNA@counts, project = "Budgerigar", min.cells = 3, min.features = 200)

Budgerigar$stim <- "Budgerigar"
Budgerigar <- subset(Budgerigar, subset = nFeature_RNA > 200)
dim(Budgerigar)
Budgerigar <- NormalizeData(Budgerigar, verbose = FALSE)


stim21_matrix <-read.table("stim21_matrix_uniq_symbol.txt",head=T,row.names = 1,sep="\t")

stim21<- CreateSeuratObject(counts = stim21_matrix, project = "stim21", min.cells = 3, min.features = 200)


canary <- CreateSeuratObject(counts = canary@assays$RNA@counts, project = "canary", min.cells = 3, min.features = 200)

canary$stim <- "canary"
canary <- subset(canary, subset = nFeature_RNA > 200)
dim(canary)
canary <- NormalizeData(canary, verbose = FALSE)

cat <- CreateSeuratObject(counts = cat@assays$RNA@counts, project = "cat", min.cells = 3, min.features = 200)

cat$stim <- "cat"
cat <- subset(cat, subset = nFeature_RNA > 200)
dim(cat)
cat <- NormalizeData(cat, verbose = FALSE)


chicken <- CreateSeuratObject(counts = chicken@assays$RNA@counts, project = "chicken", min.cells = 3, min.features = 200)

chicken$stim <- "chicken"
chicken <- subset(chicken, subset = nFeature_RNA > 200)
dim(chicken)
chicken <- NormalizeData(chicken, verbose = FALSE)

duck <- CreateSeuratObject(counts = duck@assays$RNA@counts, project = "duck", min.cells = 3, min.features = 200)

duck$stim <- "duck"
duck <- subset(duck, subset = nFeature_RNA > 200)
dim(duck)
duck <- NormalizeData(duck, verbose = FALSE)

human <- CreateSeuratObject(counts = human@assays$RNA@counts, project = "human", min.cells = 3, min.features = 200)

human$stim <- "human"
human <- subset(human, subset = nFeature_RNA > 200)
dim(human)
human <- NormalizeData(human, verbose = FALSE)

mouse <- CreateSeuratObject(counts = mouse@assays$RNA@counts, project = "mouse", min.cells = 3, min.features = 200)

mouse$stim <- "mouse"
mouse <- subset(mouse, subset = nFeature_RNA > 200)
dim(mouse)
mouse <- NormalizeData(mouse, verbose = FALSE)

snake <- CreateSeuratObject(counts = snake@assays$RNA@counts, project = "snake", min.cells = 3, min.features = 200)

snake$stim <- "snake"
snake <- subset(snake, subset = nFeature_RNA > 200)
dim(snake)
snake <- NormalizeData(snake, verbose = FALSE)

snakehead <- CreateSeuratObject(counts = snakehead@assays$RNA@counts, project = "snakehead", min.cells = 3, min.features = 200)

snakehead$stim <- "snakehead"
snakehead <- subset(snakehead, subset = nFeature_RNA > 200)
dim(snakehead)
snakehead <- NormalizeData(snakehead, verbose = FALSE)



tilia <- CreateSeuratObject(counts = tilia@assays$RNA@counts, project = "tilia", min.cells = 3, min.features = 200)

tilia$stim <- "tilia"
tilia <- subset(tilia, subset = nFeature_RNA > 200)
dim(tilia)
tilia <- NormalizeData(tilia, verbose = FALSE)




axolotl<-Read10X(data.dir ="./axolotl/", gene.column=1)
stim1 <- CreateSeuratObject(counts = axolotl, project = "stim1", min.cells = 3, min.features = 200)
stim1$stim <- "stim1"
stim1 <- subset(stim1, subset = nFeature_RNA > 300)
stim1 <- NormalizeData(stim1, verbose = FALSE)



stim2_matrix <-read.table("stim2_matrix.txt",head=T,sep="\t")
countData2<-stim2_matrix[,2:10735]
rownames(countData2) = make.names(stim2_matrix $X, unique=TRUE)
stim2 <- CreateSeuratObject(counts = countData2, project = "stim2", min.cells = 3)
stim2$stim <- "stim2"
stim2 <- subset(stim2, subset = nFeature_RNA > 200)
stim2 <- NormalizeData(stim2, verbose = FALSE)




stim5_matrix<-read.table("stim5_matrix.txt",head=T,row.names = 1,sep="\t")
stim5<- CreateSeuratObject(counts = stim5_matrix, project = "stim5", min.cells = 3)
stim5$stim <- "stim5"
stim5 <- subset(stim5, subset = nFeature_RNA > 200)
stim5 <- NormalizeData(stim5, verbose = FALSE)




stim6_matrix <-read.table("stim6_matrix.txt",head=T,row.names = 1,sep="\t")
stim6<- CreateSeuratObject(counts = stim6_matrix, project = "stim6", min.cells = 3)
stim6$stim <- "stim6"
stim6 <- subset(stim6, subset = nFeature_RNA > 150)
stim6 <- NormalizeData(stim6, verbose = FALSE)


stim7_matrix <-read.table("stim7_matrix.txt",head=T,row.names = 1,sep="\t")
stim7<- CreateSeuratObject(counts = stim7_matrix, project = "stim7", min.cells = 3)
stim7$stim <- "stim7"
stim7 <- subset(stim7, subset = nFeature_RNA > 150)
stim7 <- NormalizeData(stim7, verbose = FALSE)



stim8_matrix <-read.table("stim8_matrix.txt",head=T,row.names = 1,sep="\t")

stim8<- CreateSeuratObject(counts = stim8_matrix, project = "stim8", min.cells = 3)
stim8$stim <- "stim8"
stim8 <- subset(stim8, subset = nFeature_RNA > 150)
stim8 <- NormalizeData(stim8, verbose = FALSE)


stim11_matrix <-read.table("stim11_matrix.txt",head=T,row.names = 1,sep="\t")

stim11<- CreateSeuratObject(counts = stim11_matrix, project = "stim11", min.cells = 3)
stim11$stim <- "stim11"
stim11 <- subset(stim11, subset = nFeature_RNA > 150)
stim11 <- NormalizeData(stim11, verbose = FALSE)



stim14_matrix <-read.table("stim14_matrix.txt",head=T,row.names = 1,sep="\t")

stim14<- CreateSeuratObject(counts = stim14_matrix, project = "stim14", min.cells = 3)
stim14$stim <- "stim14"
stim14 <- subset(stim14, subset = nFeature_RNA > 200)
stim14 <- NormalizeData(stim14, verbose = FALSE)


stim15_matrix <-read.table("stim15_matrix.txt",head=T,row.names = 1,sep="\t")

stim15<- CreateSeuratObject(counts = stim15_matrix, project = "stim15", min.cells = 3)
stim15$stim <- "stim15"
stim15 <- subset(stim15, subset = nFeature_RNA > 200)
stim15 <- NormalizeData(stim15, verbose = FALSE)



stim16_matrix <-read.table("stim16_matrix.txt",head=T,row.names = 1,sep="\t")
stim16<- CreateSeuratObject(counts = stim16_matrix, project = "stim16", min.cells = 3)
stim16$stim <- "stim16"
stim16 <- subset(stim16, subset = nFeature_RNA > 150)
stim16 <- NormalizeData(stim16, verbose = FALSE)



stim17_matrix_rename_colnames_rmove_loc_genenames<-read.table("stim17_matrix_rename_colnames_rmove_loc_genenames.txt",head=T,row.names = 1,sep="\t")

stim17<- CreateSeuratObject(counts = stim17_matrix_rename_colnames_rmove_loc_genenames, project = "stim17", min.cells = 3)
stim17$stim <- "stim17"
stim17 <- subset(stim17, subset = nFeature_RNA > 150)
stim17 <- NormalizeData(stim17, verbose = FALSE)



stim18_matrix <-read.table("stim18_matrix_nona.txt",head=T,row.names = 1,sep="\t")
stim18<- CreateSeuratObject(counts = stim18_matrix, project = "stim18", min.cells = 3)
stim18$stim <- "stim18"
stim18 <- subset(stim18, subset = nFeature_RNA > 150)
stim18 <- NormalizeData(stim18, verbose = FALSE)





stim22_matrix <-read.table("stim22_matrix.txt",head=T,row.names = 1,sep="\t")

stim22<- CreateSeuratObject(counts = stim22_matrix, project = "stim22", min.cells = 3)
stim22$stim <- "stim22"
stim22 <- subset(stim22, subset = nFeature_RNA > 150)
stim22 <- NormalizeData(stim22, verbose = FALSE)



stim24_matrix <-read.table("stim24_matrix.txt",head=T,row.names = 1,sep="\t")

stim24<- CreateSeuratObject(counts = stim24_matrix, project = "stim24", min.cells = 3)
stim24$stim <- "stim24"
stim24 <- subset(stim24, subset = nFeature_RNA > 150)
stim24 <- NormalizeData(stim24, verbose = FALSE)

pbmc.big <- merge(Budgerigar, y = c(canary, cat, chicken, duck, human, mouse, snake, snakehead, tilia, stim1, stim2, stim5, stim6, stim7, stim8, stim11, stim14, stim15, stim16, stim17, stim18, stim22, stim24), add.cell.ids = c("Budgerigar", "canary", "cat", "chicken", "duck", "human", "mouse", "snake", "snakehead", "tilia", "stim1", "stim2", "stim5", "stim6", "stim7", "stim8", "stim11", "stim14", "stim15", "stim16", "stim17", "stim18", "stim22", "stim24"), project = "merge_all_Species")
