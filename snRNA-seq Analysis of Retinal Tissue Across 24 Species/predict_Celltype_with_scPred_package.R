library(scPred)
library(Seurat)
monkey<-readRDS("/Users/retina/revise/Monkey/monkey.rds")
immune.combinedr<-readRDS("/Users/retina/revise/species/immune.combinedr.rds")
dog<-readRDS("/Users/retina/revise/dog/dog.rds")
cat<-readRDS("/Users/retina/revise/cat/cat.rds")


DimPlot(monkey)
DimPlot(immune.combinedr)
DimPlot(dog)

# build model using annotated monkey dataset
Idents(monkey) <- "Celltypes"



referencemonkey <- getFeatureSpace(monkey, "Celltypes")
referencemonkey <- trainModel(referencemonkey)


get_probabilities(referencemonkey) %>% head()
get_scpred(referencemonkey)
plot_probabilities(referencemonkey)

# predict merged object with the monkey model

query_mergedmonkey <- scPredict(immune.combinedr, referencemonkey)


query_mergedmonkey <- RunUMAP(query_mergedmonkey, reduction = "scpred", dims = 1:20)

DimPlot(query_mergedmonkey, group.by = "scpred_no_rejection", label = T, repel = TRUE)
saveRDS(query_mergedmonkey,"query_mergedmonkey.rds")


# predict dog object with the monkey model

query_dogmonkey <- scPredict(dog, referencemonkey)


query_dogmonkey <- RunUMAP(query_dogmonkey, reduction = "scpred", dims = 1:20)

DimPlot(query_dogmonkey, group.by = "scpred_no_rejection", label = T, repel = TRUE)
saveRDS(query_dogmonkey,"query_mergedmonkey.rds")


# predict cat object with the monkey model

query_catmonkey <- scPredict(cat, referencemonkey)


query_catmonkey <- RunUMAP(query_catmonkey, reduction = "scpred", dims = 1:20)

DimPlot(query_catmonkey, group.by = "scpred_no_rejection", label = T, repel = TRUE)
saveRDS(query_catmonkey,"query_mergedmonkey.rds")



  
