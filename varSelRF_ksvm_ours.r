## r mad 数据前处理下，backgroud,batcheffect,normalization,mad

##find function parameters from package vignette
setwd("/Users/lishasha/Desktop/home/project/2016/circRNA/classifier")
prostate <- read.table("cluster_CBC1_t_rm_bactcheffect_for_rf_svm.txt",head=T)
dim(prostate)
#q<-read.table("log2normalized_all_feature.txt",row.names = 1)
#tq<-t(q)
x <- as.matrix(prostate[, 2:4920])
y <- prostate[, 1]
set.seed(1)
train <- sample(1:nrow(x), nrow(x) * 2/3)

test <- (-train)

library(varSelRF)


##feature selection

set.seed(123)
rf.cms1.tm <- varSelRF(x[train, ],y[train],c.sd = 1, ntree = 500,
                    ntreeIterat = 500, vars.drop.num = NULL, vars.drop.frac = 0.2,
                    whole.range = FALSE, recompute.var.imp = FALSE, verbose = FALSE,
                    returnFirstForest = TRUE, fitted.rf = NULL, keep.forest = TRUE)

var<-rf.cms1.tm$selected.vars
write.table(as.matrix(var),"Vars.in.Forest.txt")

#将含有选择变量的行提出来，组成20*422的新矩阵
a<-read.table("selected_data_rm_rf_ksvm.txt",head=T)
dim(a)
x <- as.matrix(a[, 2:423])
y <- a[, 1]
set.seed(1)
train <- sample(1:nrow(x), nrow(x) * 2/3)
test <- (-train)
##setup svm classifier

library(kernlab)  ＃kernlab: Kernel-Based Machine Learning Lab
set.seed(123)
svm.cms1 <- ksvm(x = x[train, ], y = y[train], kernel = "vanilladot", prob.model = TRUE )

#predict_test <- predict(svm.cms1, x[test, ], type = "probabilities") #prob=TRUE 不设置输出为标签
predict_test <- predict(svm.cms1, x[test, ])
table(y[test], predict_test)
library(e1071)
library(caret)
confusionMatrix(data= predict_test, reference=y[test])

#3 predict response for the validation sample and calculate model accuracy for the sample

cohort2<-read.table("plasm_cohort2_rm_ksvm.txt",head=T)
dim(cohort2)

predict_corhort2 <- predict(svm.cms1,cohort2[,-1])
#predict_corhort2 <- predict(svm.cms1,cohort2[,-1],type = "probabilities")
confusionMatrix(data = predict_corhort2, reference = cohort2[,1])

#http://www.cnblogs.com/zgw21cn/archive/2011/02/18/1413656.html	