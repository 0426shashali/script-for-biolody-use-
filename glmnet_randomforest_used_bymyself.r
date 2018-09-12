setwd("/Users/lishasha/Desktop/home/project/2016/circRNA/classifier")
prostate <- read.table("cluster_CBC1_t_rm_bactcheffect.txt",head=T)
dim(prostate)
#q<-read.table("log2normalized_all_feature.txt",row.names = 1)
#tq<-t(q)
x <- as.matrix(tq[, 2:87936])
y <- tq[, 1]
set.seed(1)
train <- sample(1:nrow(x), nrow(x) * 2/3)

test <- (-train)
library(Matrix)
library(glmnet)

r2 <- glmnet(x = x[train, ], y = y[train], family = "binomial", alpha = 1)

plot(r2, xvar = "lambda")
r2.cv <- cv.glmnet(x = x, y = y, family = "binomial", alpha = 1, nfold = 10)
plot(r2.cv)
model.coef <- coef(r2.cv$glmnet.fit,s=r2.cv$lambda.min)
write.table(as.matrix(model.coef),"coef_train_r2_cv_fit_min_rm_all.txt")

#randomforest
#seperate data
a<-read.table("selected_data_rm_all.txt",head=T)
dim(a)
x <- as.matrix(a[, 2:10])
y <- a[, 1]
set.seed(1)
train <- sample(1:nrow(x), nrow(x) * 2/3)
test <- (-train)

#1 train model
library(randomForest)
set.seed(71)
model <- randomForest(x = x[train, ], y = y[train], importance=TRUE,
                        proximity=TRUE)
print(model)

plot(model)

# Variable Importance Plot
varImpPlot(model,
           sort = T,
           main="Variable Importance",
           n.var=9)
#2 Predicting test data
predict_test <- predict(model ,x[test, ])

table(observed = y[test], predicted = predict_test)
library(e1071)
library(caret)
confusionMatrix(data= predict_test, reference=y[test])

#3 predict response for the validation sample and calculate model accuracy for the sample

cohort2<-read.table("plasm_cohort2_rm_all.txt",head=T)
dim(cohort2)

predict_corhort2 <- predict(model,cohort2[,-1])
confusionMatrix(data = predict_corhort2, reference = cohort2[,1])




