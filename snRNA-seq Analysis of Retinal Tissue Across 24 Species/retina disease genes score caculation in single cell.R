#Stationary night blindness
example_genesm1 <- c("NYX", "CACNA1F", "GRM6", "TRPM1", "CABP4", "GPR179", "LRIT3", "GNAT1", "RHO", "PDE6B", "GRK1", "RDH5", "MTMR10", "OTUD7A", "SDK2", "GPR34", "NR2E3", "SLC24A1", "CDK16", "SDK1", "USP11", "RPGR", "ZNF41", "ZNF81", "GK", "NDP", "CHRNA7", "RP2", "SYNJ1", "RPE65", "ABCA4", "CACNA2D4", "GUCY2D", "CRB1", "CACNA1D", "PRPF3", "PRPF8", "BMP8B", "STRA6", "TRPM3", "CHRFAM7A", "EYS", "SPTBN1", "SGPL1", "BSN", "MYBPC1", "CNGB3", "TULP1", "CNGA3", "SOX3", "AIPL1", "OPN4", "RPGRIP1", "SAG", "OCA2", "CASK", "KNTC1", "MAOB", "GDF5", "CDR1", "CRX", "ADRB3", "IDUA", "RBP3")
example_summ1 <- apply( X = merged@assays$RNA[example_genesm1], MARGIN = 2, FUN = mean )

new_combinem1 <- AddMetaData(object = merged, metadata = example_summ1, col.name = "example_summ1")
FeaturePlot(object = new_combinem1, features = "example_summ1", reduction = "umap", min.cutoff = "q9",max.cutoff = 0.8)


my_levels <- c("ACs", "Rods", "BPs", "Cones", "Endo", "HCs", "RGCs", "Microglia", "Macroglia", "Muller", "Pericyte", "Astrocyte")

levels(new_combinem1) <- my_levels

VlnPlot(new_combinem1, features = "example_summ1", pt.size = 0, combine = FALSE, cols=c("#00B050","#0096FF","#BB7DC4","#F0BACD","#CF5435","blue","#FF515F","#EA9847","#753D2D","#FFFC00", "#FF7E79","black"))


Idents(new_combinem1) <- "stim"
VlnPlot(new_combinem1, features = "example_summ1", pt.size = 0, combine = FALSE)

write.table(merged@assays$RNA[example_genesm1],"Stationary_night_blindness_speciescone.txt",sep="\t")





#Rod-Cone Dystrophy
Idents(merged) <- "byumap4"
example_genesm1 <- c("CNGA3", "CNGB3", "GNAT2", "PDE6C", "OPN1SW", "ABCA4", "ADAM9", "AIPL1", "C8orf37", "CACNA1F", "CACNA2D4", "CDHR1", "CERKL", "CNGA3", "CRX", "GUCA1A", "GUCY2D", "KCNV2", "PDE6C", "PDE6H", "PITPNM3", "PROM1", "PRPH2", "RAX2", "RDH5", "RPGR", "RPGRIP1", "SEMA4A", "ALMS1", "ATXN7", "BBS1", "CNNM4", "NF1")
example_summ1 <- apply( X = merged@assays$RNA[example_genesm1], MARGIN = 2, FUN = mean )

new_combinem1 <- AddMetaData(object = merged, metadata = example_summ1, col.name = "example_summ1")
FeaturePlot(object = new_combinem1, features = "example_summ1", reduction = "umap", min.cutoff = "q9",max.cutoff = 0.8)


my_levels <- c("ACs", "Rods", "BPs", "Cones", "Endo", "HCs", "RGCs", "Microglia", "Macroglia", "Muller", "Pericyte", "Astrocyte")

levels(new_combinem1) <- my_levels

VlnPlot(new_combinem1, features = "example_summ1", pt.size = 0, combine = FALSE, cols=c("#00B050","#0096FF","#BB7DC4","#F0BACD","#CF5435","blue","#FF515F","#EA9847","#753D2D","#FFFC00", "#FF7E79","black"))


Idents(new_combinem1) <- "stim"
VlnPlot(new_combinem1, features = "example_summ1", pt.size = 0, combine = FALSE)

write.table(example_summ1,"Rod_Cone_Dystrophy_species.txt",sep="\t")




#Retinitis Pigmentosa
Idents(merged) <- "byumap4"
example_genesm1 <- c("ABCA4", "CERKL", "CNGB1", "CRB1", "CRX", "EYS", "FSCN2", "GUCA1B", "IMPDH1", "LRAT", "MERTK", "NR2E3", "NRL", "PDC", "PDE6A", "PDE6B", "PRPF31", "PRPH2", "RDH12", "RGR", "RHO", "RLBP1", "RP1", "RP2", "RPE65", "RPGR", "TOPORS", "TULP1", "USH2A")
example_summ1 <- apply( X = merged@assays$RNA[example_genesm1], MARGIN = 2, FUN = mean )

new_combinem1 <- AddMetaData(object = merged, metadata = example_summ1, col.name = "example_summ1")
FeaturePlot(object = new_combinem1, features = "example_summ1", reduction = "umap", min.cutoff = "q9",max.cutoff = 0.8)


my_levels <- c("ACs", "Rods", "BPs", "Cones", "Endo", "HCs", "RGCs", "Microglia", "Macroglia", "Muller", "Pericyte", "Astrocyte")

levels(new_combinem1) <- my_levels

VlnPlot(new_combinem1, features = "example_summ1", pt.size = 0, combine = FALSE, cols=c("#00B050","#0096FF","#BB7DC4","#F0BACD","#CF5435","blue","#FF515F","#EA9847","#753D2D","#FFFC00", "#FF7E79","black"))


Idents(new_combinem1) <- "stim"
VlnPlot(new_combinem1, features = "example_summ1", pt.size = 0, combine = FALSE)

write.table(example_summ1,"Retinitis_Pigmentosa_species.txt",sep="\t")



#colour weakness
"OPN1LW", "OPN1MW", "OPN1SW"
Idents(merged) <- "byumap4"
example_genesm1 <- c("OPN1LW", "OPN1MW", "OPN1SW")
example_summ1 <- apply( X = merged@assays$RNA[example_genesm1], MARGIN = 2, FUN = mean )

new_combinem1 <- AddMetaData(object = merged, metadata = example_summ1, col.name = "example_summ1")
FeaturePlot(object = new_combinem1, features = "example_summ1", reduction = "umap", min.cutoff = "q9",max.cutoff = 0.8)


my_levels <- c("ACs", "Rods", "BPs", "Cones", "Endo", "HCs", "RGCs", "Microglia", "Macroglia", "Muller", "Pericyte", "Astrocyte")

levels(new_combinem1) <- my_levels

VlnPlot(new_combinem1, features = "example_summ1", pt.size = 0, combine = FALSE, cols=c("#00B050","#0096FF","#BB7DC4","#F0BACD","#CF5435","blue","#FF515F","#EA9847","#753D2D","#FFFC00", "#FF7E79","black"))


Idents(new_combinem1) <- "stim"
VlnPlot(new_combinem1, features = "example_summ1", pt.size = 0, combine = FALSE)

write.table(example_summ1,"colour weakness_species.txt",sep="\t")


#Leber congenital amaurosis
Idents(merged) <- "byumap4"
example_genesm1 <- c("CEP290", "CRB1", "GUCY2D", "RPE65")
example_summ1 <- apply( X = merged@assays$RNA[example_genesm1], MARGIN = 2, FUN = mean )

new_combinem1 <- AddMetaData(object = merged, metadata = example_summ1, col.name = "example_summ1")
FeaturePlot(object = new_combinem1, features = "example_summ1", reduction = "umap", min.cutoff = "q9",max.cutoff = 0.8)

my_levels <- c("ACs", "Rods", "BPs", "Cones", "Endo", "HCs", "RGCs", "Microglia", "Macroglia", "Muller", "Pericyte", "Astrocyte")

levels(new_combinem1) <- my_levels

VlnPlot(new_combinem1, features = "example_summ1", pt.size = 0, combine = FALSE, cols=c("#00B050","#0096FF","#BB7DC4","#F0BACD","#CF5435","blue","#FF515F","#EA9847","#753D2D","#FFFC00", "#FF7E79","black"))


Idents(new_combinem1) <- "stim"
VlnPlot(new_combinem1, features = "example_summ1", pt.size = 0, combine = FALSE)

write.table(example_summ1,"Leber_congenital_amaurosis_species.txt",sep="\t")





#Age Related Macular Degeneration
Idents(merged) <- "byumap4"
example_genesm1 <- c("CFH", "ARMS2", "SKIV2L", "CFHR4", "HTRA1", "C3", "CFB", "KCNT2", "CFHR1", "PLEKHA1", "C2", "APOC1", "CFHR5", "CETP", "SYN3", "F13B", "ASPM", "ZBTB41", "COL8A1", "CFHR3", "SLC16A8", "NOTCH4", "TGFBR1", "CFHR2", "CRB1", "CCDC109B", "RAD51B", "NELFE", "BTBD16", "TNXB", "ADAMTS9-AS2", "STK19", "REST", "COL10A1", "EGFL8", "RNF5", "AGPAT1", "PLA2G12A", "TOMM40", "ABCA1", "GPR152", "MAP2", "ADD3", "PVRL2", "RREB1", "TNFRSF10A", "SCN4A", "EHMT2", "LY6G6F", "PTGES3", "CNKSR2", "FBXO15", "SNTG1", "ANKRD45", "TYR", "BTBD2", "DAZAP1", "YY1AP1", "ADCYAP1R1", "EPB41L4A", "CAP2", "CAPN7", "OBSCN", "SET", "MSN", "METTL16", "RIMS3", "FRAT2", "ELP2", "NFIB", "FILIP1L", "OSBPL6", "CLIC5", "SKA1", "DOK5", "GLI3", "PRKAG3", "CTNNA2", "TOMM34", "GJA8", "SLC27A2", "FSTL5", "ARL15", "MYO16", "MTA1", "INHBC", "SLC9C2", "APBB1IP", "SLC24A5", "KLHL20", "AIP", "VAV2", "DARS2", "MAP3K19", "NAPEPLD", "SAPCD1", "ROBO1", "NAA30", "ADAMTS17", "CNTNAP4", "NDST3", "ADCY2", "UNC13C", "ABCA4", "MSH5", "TRMT13", "LIPC", "ANTXR1", "DCC", "SLC35A3", "TNS1", "ANKRD16", "PLCB1", "RNF125", "CLUL1", "AIF1", "IGFBP7", "GRID2", "KLF12", "YOD1", "LY6G5C", "AGL", "RRP1", "FSIP1", "NKAIN3", "KIF21B", "PADI1", "MAP2K1", "POLR2B", "TNFRSF13B", "FAM155A", "FAM177B", "GART", "RMDN2", "CSMD1", "AKAP12", "ABL1", "SLC14A2", "PARK2", "NCAM2", "AOAH", "ATP6V0A4", "PAK7", "PFKFB2", "DXO", "DIS3L", "TEX9", "AKAP13", "TCF7", "OPCML", "GFOD1", "MCC", "TNIP2", "WDPCP", "KIAA1549L", "ACPP", "LARGE", "LAMP5", "PADI4", "ITPR1", "SLC6A5", "PROM1", "ZW10", "PTPRN2", "MBTPS1", "RYBP", "GRAMD3", "TSPEAR", "ETV6", "USP28", "ADAM12", "TANC1", "NXN", "PTPRT", "VIT", "LRRK1", "KCNIP1", "SPOCK1", "TNR", "FAM193A", "DCDC2", "ANKRD12", "ETV1", "PRELID2", "CACNA2D1", "TACC2", "ITGAE", "PAPPA2", "ATXN1", "ARL6IP5", "ZNF516", "RIN3", "SV2C", "FAM171A1", "KDM4B", "AGPAT2", "KCNJ6")
example_summ1 <- apply( X = merged@assays$RNA[example_genesm1], MARGIN = 2, FUN = mean )

new_combinem1 <- AddMetaData(object = merged, metadata = example_summ1, col.name = "example_summ1")
FeaturePlot(object = new_combinem1, features = "example_summ1", reduction = "umap", min.cutoff = "q9",max.cutoff = 0.8)


my_levels <- c("ACs", "Rods", "BPs", "Cones", "Endo", "HCs", "RGCs", "Microglia", "Macroglia", "Muller", "Pericyte", "Astrocyte")

levels(new_combinem1) <- my_levels

VlnPlot(new_combinem1, features = "example_summ1", pt.size = 0, combine = FALSE, cols=c("#00B050","#0096FF","#BB7DC4","#F0BACD","#CF5435","blue","#FF515F","#EA9847","#753D2D","#FFFC00", "#FF7E79","black"))


Idents(new_combinem1) <- "stim"
VlnPlot(new_combinem1, features = "example_summ1", pt.size = 0, combine = FALSE)

write.table(example_summ1,"Macular_Degeneration_download_own.txt",sep="\t")



#Macular Degeneration-NC PAPER
"ABCA4", "APOE", "ARMS2", "ASPM", "BEST1", "C2", "C3", "CFH", "CFHR5", "CFI", "CST3", "ELOVL4", "ERCC6", "FBLN5", "HTRA1", "LIPC"

Idents(merged) <- "byumap4"
example_genesm1 <- c("ABCA4", "APOE", "ARMS2", "ASPM", "BEST1", "C2", "C3", "CFH", "CFHR5", "CFI", "CST3", "ELOVL4", "ERCC6", "FBLN5", "HTRA1", "LIPC")
example_summ1 <- apply( X = merged@assays$RNA[example_genesm1], MARGIN = 2, FUN = mean )

new_combinem1 <- AddMetaData(object = merged, metadata = example_summ1, col.name = "example_summ1")
FeaturePlot(object = new_combinem1, features = "example_summ1", reduction = "umap", min.cutoff = "q9",max.cutoff = 0.8)


my_levels <- c("ACs", "Rods", "BPs", "Cones", "Endo", "HCs", "RGCs", "Microglia", "Macroglia", "Muller", "Pericyte", "Astrocyte")

levels(new_combinem1) <- my_levels

VlnPlot(new_combinem1, features = "example_summ1", pt.size = 0, combine = FALSE, cols=c("#00B050","#0096FF","#BB7DC4","#F0BACD","#CF5435","blue","#FF515F","#EA9847","#753D2D","#FFFC00", "#FF7E79","black"))


Idents(new_combinem1) <- "stim"
VlnPlot(new_combinem1, features = "example_summ1", pt.size = 0, combine = FALSE)

write.table(example_summ1,"Macular_Degeneration_NC_PAPER_species.txt",sep="\t")



#Colour Blindness
Idents(merged) <- "byumap4"
example_genesm1 <- c("CNGA3", "CNGB3", "GNAT2", "PDE6C", "PDE6H", "OPN1LW", "OPN1MW", "OPN1SW")
example_summ1 <- apply( X = merged@assays$RNA[example_genesm1], MARGIN = 2, FUN = mean )

new_combinem1 <- AddMetaData(object = merged, metadata = example_summ1, col.name = "example_summ1")
FeaturePlot(object = new_combinem1, features = "example_summ1", reduction = "umap", min.cutoff = "q9",max.cutoff = 2)


my_levels <- c("ACs", "Rods", "BPs", "Cones", "Endo", "HCs", "RGCs", "Microglia", "Macroglia", "Muller", "Pericyte", "Astrocyte")

levels(new_combinem1) <- my_levels

VlnPlot(new_combinem1, features = "example_summ1", pt.size = 0, combine = FALSE, cols=c("#00B050","#0096FF","#BB7DC4","#F0BACD","#CF5435","blue","#FF515F","#EA9847","#753D2D","#FFFC00", "#FF7E79","black"))


Idents(new_combinem1) <- "stim"
VlnPlot(new_combinem1, features = "example_summ1", pt.size = 0, combine = FALSE)

write.table(example_summ1,"Retinal_Disorders_species.txt",sep="\t")



#Retinal Disorders
Idents(merged) <- "byumap4"
example_genesm1 <- c("BBS1", "BBS10", "CEP290", "MKKS", "CYP4V2", "CHM", "CTC1", "CACNA1F", "CRB1", "CRX", "GUCY2D", "PRPH2", "RDH5", "RPE65", "COL18A1", "IFT140", "PEX7", "PHYH", "IGFBP7", "CLRN1", "PDE6B", "RHO", "RP2", "USH2A", "WDR19", "NPHP1", "TRNT1", "VCAN", "RS1")
example_summ1 <- apply( X = merged@assays$RNA[example_genesm1], MARGIN = 2, FUN = mean )

new_combinem1 <- AddMetaData(object = merged, metadata = example_summ1, col.name = "example_summ1")
FeaturePlot(object = new_combinem1, features = "example_summ1", reduction = "umap", min.cutoff = "q9",max.cutoff = 2)


my_levels <- c("ACs", "Rods", "BPs", "Cones", "Endo", "HCs", "RGCs", "Microglia", "Macroglia", "Muller", "Pericyte", "Astrocyte")

levels(new_combinem1) <- my_levels

VlnPlot(new_combinem1, features = "example_summ1", pt.size = 0, combine = FALSE, cols=c("#00B050","#0096FF","#BB7DC4","#F0BACD","#CF5435","blue","#FF515F","#EA9847","#753D2D","#FFFC00", "#FF7E79","black"))


Idents(new_combinem1) <- "stim"
VlnPlot(new_combinem1, features = "example_summ1", pt.size = 0, combine = FALSE)

write.table(example_summ1,"Retinal_Disorders_species.txt",sep="\t")




Vision_Impairment_and_Blindness
example_genesm1 <- c("FTL", "SLITRK6", "ALMS1", "GNAT1", "GRM6", "TRPM1", "PNPLA6", "RGS9", "RGS9BP", "FREM1", "MCOLN1", "SMOC1", "LRP5", "NYX")


