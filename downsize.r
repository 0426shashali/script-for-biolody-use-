library(Seurat)
table(mouse$celltype)

Idents(mouse)<-"celltype"

mouse.small <- subset(mouse, downsample = 400)
table(mouse.small$celltype)
saveRDS(mouse.small,"downsize_400cells_mouse.rds
")